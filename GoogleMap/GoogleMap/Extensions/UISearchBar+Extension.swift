//
//  UISearchBar+Extension.swift
//  ePrice-Label
//
//  Created by Kavya Krishna K. on 16/09/24.
//

import UIKit

extension UISearchBar {
    func addDoneButtonOnKeyboard() {
        // Create a toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Create a "Done" button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        // Optional: Add flexible space so that the "Done" button appears on the right
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // Add "Done" button to the toolbar
        toolbar.items = [flexibleSpace, doneButton]
        
        // Set the toolbar as the input accessory view for the searchBar
        self.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        // Dismiss the keyboard
        self.resignFirstResponder()
    }
}
