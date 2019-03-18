//
//  ViewController.swift
//  Testing app for memeMeApp
//
//  Created by Jose Ramos on 3/16/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var pickImageButton: UIButton!
    
    @IBOutlet var topTextField: UITextField!
    
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var imagePickerView: UIImageView!
    
    let pickerController = UIImagePickerController()
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.imagePickerView.contentMode = UIView.ContentMode.scaleAspectFit
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePickerView.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 600)
        imagePickerView.backgroundColor = UIColor.white
        imagePickerView.center = self.view.center
        
        self.pickerController.delegate = self
        
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        
        self.topTextField.textFieldLayout(view: self.view, yPosition: 100, text: "TOP", placeholder: "", topOrBottomPosition: "top")
        
        self.bottomTextField.textFieldLayout(view: self.view, yPosition: 400, text: "BOTTOM", placeholder: "", topOrBottomPosition: "bottom")
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        
        
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
    
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    
    }
    
    @IBAction func pickAnImageFromCamara(_ sender: Any) {
        
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
    
}

extension UITextField {
    
    func textFieldLayout(view: UIView, yPosition: Int, text: String, placeholder: String, topOrBottomPosition: String){
        
        let width = Int(view.frame.width)
        var height = Int(view.frame.height)
        
        if topOrBottomPosition == "top" {
            
            height = (height/3)
            
        }
        else if topOrBottomPosition == "bottom" {
            
            height = (1 * height) / 3
        }
        
        self.frame = CGRect(x: 0, y: yPosition, width: width, height: 60)
        
        self.text = text
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font = UIFont(name: "GillSans-Bold", size: 40)
        self.defaultTextAttributes[.strokeColor] = UIColor.black
        self.defaultTextAttributes[.strokeWidth] = -7
        self.borderStyle = .none
        self.placeholder = placeholder
        self.autocapitalizationType = .allCharacters
        self .autocorrectionType = .no
        
    }
}
