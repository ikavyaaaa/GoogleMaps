//
//  UITextField+Extension.swift
//  E-Price
//
//  Created by Vishnu's Playstation on 07/02/24.
//

import UIKit


extension UILabel {

    func animate(newText: String, characterDelay: TimeInterval) {

        DispatchQueue.main.async {

            self.text = ""

            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }

}

extension UILabel {
    
    /// Sets the label text with an asterisk (*) in red color.
    /// - Parameters:
    ///   - text: The main text without the asterisk.
    ///   - defaultTextColor: The default color for the main text. (Default: Black)
    func setAsteriskRed(for text: String, defaultTextColor: UIColor = UIColor.ePriceDarkGray) {
        let labelText = "\(text) *"
        
        let attributedString = NSMutableAttributedString(string: labelText)
        
        let defaultAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: defaultTextColor
        ]
        attributedString.addAttributes(defaultAttributes, range: NSRange(location: 0, length: text.count))
        
        let redAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        attributedString.addAttributes(redAttributes, range: NSRange(location: text.count, length: 2))
        
        
        self.attributedText = attributedString
    }
}

