//
//  UserDefault+Extension.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 01/03/24.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case unitsNotation
        case temperatureNotation
        case allowDownloadsOverCellular
    }

    func reset() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
