//
//  UIButton+Extension.swift
//  E-Price
//
//  Created by Kavya Krishna K. on 01/02/2024.
//

import UIKit

extension UIButton {
    func makeCircular() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    func rotateAntiClockUp() {
        self.imageView?.rotateUpAntiClock()
        
    }
    
    func rotateAntiClockDown() {
            self.imageView?.rotateDownAntiClock()
    }
}


extension UIButton {
    func setCustomStyle(title: String) {
        let font = UIFont.systemFont(ofSize: 15, weight: .bold)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.darkGray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
}
