//
//  CLPlacemark+Extension.swift
//  eprice-label
//
//  Created by Vishnu's Playstation on 13/02/24.
//

import Foundation
import CoreLocation


extension CLPlacemark {

    func makeAddressString() -> String {
        var address = ""
        if name  != nil { address = address +  name!}
        if thoroughfare  != nil { address = address + " " + thoroughfare!}
        if subThoroughfare  != nil { address = address + " " + subThoroughfare!}
        if locality  != nil { address = address + " " + locality!}
        if subLocality  != nil { address = address + " " + subLocality!}
        if administrativeArea  != nil { address = address + " " + administrativeArea!}
        if subAdministrativeArea  != nil { address = address + " " + subAdministrativeArea!}
        if postalCode  != nil { address = address + " " + postalCode!}
        if isoCountryCode  != nil { address = address + " " + isoCountryCode!}
        if country  != nil { address = address + " " + country!}

        return address
    }
}
