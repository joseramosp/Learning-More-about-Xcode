//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Jose Ramos on 3/15/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func randomColor() -> UIColor {
        // @TODO: return a random color
        
        let r: CGFloat = CGFloat(Float(arc4random() % 100)/100)
        let b: CGFloat = CGFloat(Float(arc4random() % 100)/100)
        let g: CGFloat = CGFloat(Float(arc4random() % 100)/100)
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // @TODO: Set the color of your text here!
        
        textField.textColor = self.randomColor()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        textField.text = ""
        
        return true
    }
    
}
