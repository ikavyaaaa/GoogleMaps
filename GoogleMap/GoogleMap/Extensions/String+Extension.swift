//
//  String+Extension.swift
//  MinervaIOT
//
//  Created by Mac PC on 29/12/20.
//  Copyright © 2020 ZKTeco. All rights reserved.
//

import Foundation
import UIKit

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
              let range = self[startIndex...]
                .range(of: string, options: options) {
            result.append(range)
            startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        return String(prefix(1)).capitalized + dropFirst()
    }
}

extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment, color:UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor:color])
    }
}


extension NSMutableAttributedString {
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        //self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        // Swift 4.1 and below
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 11*(UIScreen.main.bounds.width/320)), range: range)
    }
}

extension String {
    
    var uuid: String? {
        var string = self
        var index = string.index(string.startIndex, offsetBy: 8)
        for _ in 0..<4 {
            string.insert("-", at: index)
            index = string.index(index, offsetBy: 5)
        }
        // The init below is used to check the validity of the string returned.
        return UUID(uuidString: string)?.uuidString
    }
    
    var toDate : Date {
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
        let date = dateFormatter.date(from: self)!
        return date
    }
    
    
    var getBytes : [UInt8]? {
        let card = Int(self)
        let length: Int = (card! / 2) * MemoryLayout<UInt8>.size  //You could specify the desired length
        let a = withUnsafeBytes(of: card!) { bytes in
            Array(bytes.prefix(length))
        }
        return Array(a.reversed())
    }
    
    var time: String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.timeZone = TimeZone.current
        gdateFormatter.dateFormat = "yyyy-dd-MM hh:mm:ss"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: date)
        }
        return ""
        
    }
    
    
    var vTime: String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.timeZone = TimeZone.current
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    var vdateSring: String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.timeZone = TimeZone.current
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    
    var toVisitorDateandTime: String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.timeZone = TimeZone.current
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    
    var dateSring: String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.timeZone = TimeZone.current
        gdateFormatter.dateFormat = "yyyy-dd-MM hh:mm:ss"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    
    
    var ctoDate : Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)!
        return date
    }
    
    public func hasPrefix<Prefix>(_ prefix: Prefix, caseSensitive: Bool) -> Bool where Prefix : StringProtocol {
        
        if caseSensitive { return self.hasPrefix(prefix) }
        return self.lowercased().hasPrefix(prefix.lowercased())
    }
    
    func getFormattedDate(format: String) -> String {
        let gdateFormatter = DateFormatter()
        gdateFormatter.dateFormat = format
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
        gdateFormatter.dateFormat = format
        if let date = gdateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.red, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor,  value: UIColor.darkGray, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.font, value : UIFont.systemFont(ofSize: 9*(UIScreen.main.bounds.size.width/320)),  range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        if self.trimmingCharacters(in: .whitespaces) == "" {return false} else {
            let emailRegEx = "^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\\d]){1,})(?=(.*[\\W]){1,})(?!.*\\s).{8,}$"
            let passwordTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return passwordTest.evaluate(with: self)
            
        }
    }
    
    func isValidString() -> Bool {
        if self.trimmingCharacters(in: .whitespaces) == "" {return false} else {
            let emailRegEx = "[a-zA-Z\\s]+"
            let passwordTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return passwordTest.evaluate(with: self)
            
        }
    }
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func stringByAddingPercentEncodingForURLQueryParameter() -> String? {
        let allowedCharacters = NSCharacterSet.urlQueryAllowed
        return addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
    
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
            .compactMap { pattern ~= $0 ? Character($0) : nil })
    }
    
    var html2AttributedString: NSAttributedString? {
        return try! Data(from: utf8 as! Decoder).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    var toDouble: Double {
        return Double(self) ?? .nan
    }
    
    func convertDateIntoTimeStamp() -> Double  {
        
        //initialize the Date Formatter
        let dateFormatter = DateFormatter()
        
        //specify the date Format
        dateFormatter.dateFormat="yyyy-MM-dd'T'HH:mm:ss"
        
        //get date from string
        let dateString = dateFormatter.date(from: self)
        
        //get timestamp from Date
        let dateTimeStamp  = dateString?.timeIntervalSince1970 ?? 0
        return dateTimeStamp
    }
    
    func toDate (dateFormatter: DateFormatter) -> Date? {
        return dateFormatter.date(from: self)
    }
    

    var encodeEmoji: String{
        if let encodeStr = NSString(cString: self.cString(using:
                .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue){
            return encodeStr as String
        }
        return self
    }
    var decodeEmoji: String{
        let data = self.data(using: String.Encoding.utf8);
        let decodedStr = NSString(data: data!, encoding:
                                    String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr{
            return str as String
        }
        return self
    }
    
    // MARK: - Converting date and time into a proper format
    func dateConversion() -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
    
    func dateAndTime() -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
    
    func vdateAndTime() -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
    
    
    
    func dateDDMMYYY() -> String{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
    
    
    
    
    func offsetFrom() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let previousDateFormated : Date? = dateFormatter.date(from: self)
        let difference = previousDateFormated?.timeIntervalSince(currentDate)
        var differenceInDays = Int(difference!/(60 * 60 * 24 ))
        print("difference in days ---->\(differenceInDays)")
        if(differenceInDays <= 0){
            differenceInDays = 0
        }
        return String(describing: differenceInDays)
        
    }
    
    
    func ReturnCurrentTimeUsingDateFormat() -> String  {
        let dateFormatter = DateFormatter()//YYYY-MM-DD)T
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let userCreationDate = dateFormatter.string(from:Date(timeIntervalSince1970: TimeInterval(Int64(Date().timeIntervalSince1970))))
        // print("userCreationDate is --->\(userCreationDate)")
        return userCreationDate
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }    
}

extension String {
    static func calculateBatteryStatus(batteryState: Int?) -> String {
        guard let batteryState = batteryState else {
            return ""
        }

        let v = Double(batteryState) / 1000.0
        let vs = Double(batteryState) / 1000.0
        let formattedVs = String(format: "%.1f", vs)

        if v >= 2.3 {
            return "Normal (\(formattedVs)V)"
        } else {
            return "Low Power (\(formattedVs)V)"
        }
    }
    
    static func random(_ length: Int = 8) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
