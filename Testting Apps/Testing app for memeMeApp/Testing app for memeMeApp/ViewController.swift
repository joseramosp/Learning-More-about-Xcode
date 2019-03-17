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
   
    let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 275, width: 375.00, height: 30.00));
    
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
        
        imagePickerView.backgroundColor = UIColor.black
        
        self.pickerController.delegate = self
        
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        
        self.topTextField = UITextField(frame: CGRect(x: 0, y:0, width: 375.00, height: 30.00))
        
        self.topTextField.text = "TOP"
        self.topTextField.textColor = UIColor.white
        self.topTextField.textAlignment = .center
        self.topTextField.defaultTextAttributes[.font] = UIFont(name: "GillSans Bold", size: 60)
        self.topTextField.defaultTextAttributes[.strokeColor] = UIColor.black
        self.topTextField.defaultTextAttributes[.strokeWidth] = 2
        self.topTextField.borderStyle = .none
        self.topTextField.placeholder = ""
        //self.topTextField.borderRect(forBounds: )
            
        self.bottomTextField.text = "BOTTOM"
        self.bottomTextField.textColor = UIColor.white
        self.bottomTextField.textAlignment = .center
        self.bottomTextField.defaultTextAttributes[.font] = UIFont(name: "GillSans Bold", size: 60)
        self.bottomTextField.defaultTextAttributes[.strokeColor] = UIColor.black
        self.bottomTextField.defaultTextAttributes[.strokeWidth] = 2
        self.bottomTextField.borderStyle = .none
        self.bottomTextField.allowsEditingTextAttributes = false
        self.bottomTextField.placeholder = ""
        
        myTextField.textAlignment = .center
        self.myTextField.textColor = UIColor.blue
        self.myTextField.borderStyle = .none
        self.myTextField.text = "UITextField example"
        self.myTextField.placeholder = "Place holder text"
        //myTextField.center = self.view.center
        self.view.addSubview(myTextField)
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

