//
//  costomField.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//

import SwiftUI
import Introspect
struct toolBar: ViewModifier{
    
    func body(content: Content) -> some View {
        content.introspectTextField { (textField) in
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
            let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
            doneButton.tintColor = .gray
            toolBar.items = [flexButton, doneButton]
            toolBar.setItems([flexButton, doneButton], animated: true)
            textField.inputAccessoryView = toolBar
        }
    }
}


extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}
