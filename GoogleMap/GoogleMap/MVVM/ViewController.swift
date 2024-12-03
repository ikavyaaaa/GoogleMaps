//
//  ViewController.swift
//  GoogleMap
//
//  Created by Kavya Krishna K. on 03/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAddressTouched(_ sender: UIButton) {
        let vc = AddressPickerMapVC.loadFromNib()
        vc.delegate = self
        push(vc)
    }

}

extension ViewController: GetAddressDelegate {
    func reverseGeoLocation(_ address: String, _ placemark: PlacemarkResults?) {
    }
}
