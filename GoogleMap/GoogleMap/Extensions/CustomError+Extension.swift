//
//  CustomError+Extension.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 14/10/24.
//

import Foundation

enum EPLError: Error {
    // Throw when network reachability failed
    case noInternet
    // Throw when an expected resource is not found
    case notFound
    // Throw in all other cases
    case unexpected(code: Int)
}

extension EPLError {
    var isFatal: Bool {
        if case EPLError.unexpected = self { return true }
        else { return false }
    }
}

// For each error type return the appropriate description
extension EPLError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .noInternet:
            return "noInternet".localized
        case .notFound:
            return "The specified item could not be found."
        case .unexpected(_):
            return "An unexpected error occurred."
        }
    }
}

// For each error type return the appropriate localized description
extension EPLError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternet:
            return "noInternet".localized
        case .notFound:
            return NSLocalizedString(
                "The specified item could not be found.",
                comment: "Resource Not Found"
            )
        case .unexpected(_):
            return NSLocalizedString(
                "An unexpected error occurred.",
                comment: "Unexpected Error"
            )
        }
    }
}


