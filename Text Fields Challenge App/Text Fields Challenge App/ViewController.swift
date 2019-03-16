//
//  ViewController.swift
//  Text Fields Challenge App
//
//  Created by Jose Ramos on 3/15/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockedTextField: UITextField!
    @IBOutlet weak var textFieldLock: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red:0.21, green:0.76, blue:0.74, alpha:1.0)
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.zipCodeTextField.placeholder = "ZipCode"
        
        self.cashTextField.delegate = cashDelegate
        self.cashTextField.placeholder = "Amount of cash"
        
        self.lockedTextField.delegate = self
        self.lockedTextField.placeholder = "Anything"
        self.textFieldLock.setOn(false,animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        if(textFieldLock.isOn){
            return false
        }
        else{
            return true
        }
    }
}

