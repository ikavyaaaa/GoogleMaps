//
//  AddressPickerMapVC.swift
//  eprice-label
//
//  Created by Kavya Krishna K. on 03/12/24.
//

import UIKit

import GoogleMaps
//import GoogleMapsUtils

protocol GetAddressDelegate : AnyObject {
    func reverseGeoLocation(_ address : String, _ placemark:PlacemarkResults?)
}

class AddressPickerMapVC: UIViewController {

    @IBOutlet var viewMap: UIView!
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var btnConfirm: UIButton!
    @IBOutlet var viewAddress: UIView!
    @IBOutlet var labelAddress: UILabel!
    @IBOutlet var labelTitle: UILabel!

    private var mapView: GMSMapView!
    var location : CLLocation?
    let options = GMSMapViewOptions()
    var marker = GMSMarker()
    var address  = ""
    var currentPlacemark : PlacemarkResults?
    var titleString : String?
    
    weak var delegate : GetAddressDelegate?
    
    // MARK: - View Lifecycle
    /// Called after the view controller has loaded its view into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = "Address Picker"
        options.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 15.0)
        options.frame = viewMap.bounds
        
        mapView = GMSMapView(options: options)
        viewMap.addSubview(mapView)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
       
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        LocationManager.shared.getLocation { [unowned self] location, error in
            
            if let error = error {
                print("getLocation",error.localizedDescription)
                return
            }

            guard let location = location else {
               // self?.alertMessage(message: "Unable to fetch location", buttonText: "OK", completionHandler: nil)
                return
            }
            self.location = location
            DispatchQueue.main.async {
                self.updateMap()
            }
            
        }
       
    }
    
    
    func updateMap() {
        guard let location = location else {
           // self?.alertMessage(message: "Unable to fetch location", buttonText: "OK", completionHandler: nil)
            return
        }
       
        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        marker.map = self.mapView
        
        mapView.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), zoom: 15.0)
        LocationManager.shared.getGoogleReverseGeoCodedLocation(location: location) {  placemark, error in
            print("")
            DispatchQueue.main.async { [unowned self] in
                viewAddress.isHidden = false
                address = placemark?.formattedAddress ?? ""
                labelAddress.text = address
                currentPlacemark = placemark
                mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
            }
        }
    }
    
    /// This method is called to notify the view controller that its view has just laid out its subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        viewMap.frame = viewBackground.bounds
        options.frame = viewMap.bounds
    
        if mapView != nil {
            mapView.frame = viewBackground.bounds
        }
    }
    
    @IBAction func buttonConfirmTouched(_ sender: UIButton) {
        delegate?.reverseGeoLocation(address, currentPlacemark)
        self.popViewController()
    }
    
    @IBAction func buttonBackouched(_ sender: UIButton) {
        self.popViewController()
    }
}


extension AddressPickerMapVC : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        DispatchQueue.main.async {
            self.updateMap()
        }
    }
}
