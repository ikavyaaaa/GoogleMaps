//
//  UIColor+Extension.swift
//  E-Price
//
//  Created by Kavya Krishna K. on 30/01/2024.
//

import UIKit

extension UIColor {
    struct Theme {
        static var ePriceBlack : UIColor  { return UIColor(named: "ePriceBlack")! }
        static var ePriceBlue : UIColor  { return UIColor(named: "ePriceBlue")! }
        static var ePriceDarkBlue : UIColor  { return UIColor(named: "ePriceDarkBlue")! }
        static var ePriceDarkGray : UIColor  { return UIColor(named: "ePriceDarkGray")! }
        static var ePriceDarkGreen : UIColor  { return UIColor(named: "ePriceDarkGreen")! }
        static var ePriceGray : UIColor  { return UIColor(named: "ePriceGray")! }
        static var ePriceGreen : UIColor  { return UIColor(named: "ePriceGreen")! }
        static var ePriceLightGray : UIColor  { return UIColor(named: "ePriceLightGray")! }
        static var ePriceWhite : UIColor  { return UIColor(named: "ePriceWhite")! }
        static var ePriceLightGray1 : UIColor  { return UIColor(named: "ePriceLightGray1")! }
        static var ePriceBGBlue : UIColor  { return UIColor(named: "ePriceBGBlue")! }
        static var ePriceBGLightBlue : UIColor  { return UIColor(named: "ePriceBGLightBlue")! }
        static var ePriceLightBlue : UIColor  { return UIColor(named: "ePriceLightBlue")! }

    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        //assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            self.init(white: 0.5, alpha: 1.0)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
