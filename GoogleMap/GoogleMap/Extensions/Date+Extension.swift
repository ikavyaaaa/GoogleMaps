//
//  date+Extension.swift
//  E-Price
//
//  Created by Kavya Krishna K. on 06/02/24.
//

import Foundation

extension Date {
    func formattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
}

extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }
    
    var hexDescription: String {
            return reduce("") {$0 + String(format: "%04x ", $1)}
        }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX " : "%02hhx "
        return self.map { String(format: format, $0) }.joined()
    }
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}

extension DateFormatter {
    
    /// Converts an ISO 8601 date string (e.g., "2024-09-16T04:36:44.328+00:00")
    /// into a formatted string like "December 31, 2023 9:15am".
    /// - Parameter isoDateString: The input date string in ISO 8601 format.
    /// - Returns: A formatted date string in the "MMMM d, yyyy h:mma" format, or nil if the input is invalid.
    static func convertISODateString(_ isoDateString: String) -> String? {
        // Step 1: Create a DateFormatter for the input ISO 8601 date string
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)  // Adjust to UTC
        
        // Step 2: Convert the input string to a Date object
        guard let date = inputFormatter.date(from: isoDateString) else {
            return nil  // Return nil if the date string is invalid
        }
        
        // Step 3: Create a DateFormatter for the desired output format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMMM d, yyyy h:mma"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        // Step 4: Convert the Date object to the desired output string format
        let formattedDate = outputFormatter.string(from: date)
        
        // Step 5: Return the final formatted date string in lowercase for 'am'/'pm'
        return formattedDate.lowercased()
    }
}


// MARK: - Date Formatter Extension
extension DateFormatter {
    static func convertISODateStringToDate(_ isoDateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = inputFormatter.date(from: isoDateString) else {
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMMM d, yyyy"  // Format to January 1, 2024
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return outputFormatter.string(from: date)
    }
    
    static func dateFromFormattedString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: dateString)
    }
}


extension DateFormatter {
    static func convertISODateStringToTime(_ isoDateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = inputFormatter.date(from: isoDateString) else {
            return nil
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"  // Format to show only time (e.g., 5:23 AM)
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return timeFormatter.string(from: date)
    }
}
