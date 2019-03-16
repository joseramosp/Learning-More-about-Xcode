//
//  ZipCodeTextFieldDelegate.swift
//  Text Fields Challenge App
//
//  Created by Jose Ramos on 3/15/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        textField.keyboardType = UIKeyboardType.numberPad
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if newText.length == 5 {
            return false
        }
        else{
            return true
        }
    }
}
