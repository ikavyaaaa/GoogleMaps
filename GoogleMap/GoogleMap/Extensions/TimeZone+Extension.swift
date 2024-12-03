//
//  TimeZone+Extension.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 28/06/24.
//

import Foundation

extension TimeZone {
    // Helper method to get the country name from the identifier
    func countryName() -> String? {
        let identifierComponents = self.identifier.split(separator: "/")
        return identifierComponents.count > 1 ? String(identifierComponents[0]) : nil
    }
}
