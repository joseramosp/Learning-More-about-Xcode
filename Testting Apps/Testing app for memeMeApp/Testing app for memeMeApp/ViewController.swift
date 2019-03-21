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
    @IBOutlet var imageSelector: UIToolbar!
    @IBOutlet var shareAndSaveBar: UINavigationBar!
    
    struct Meme {
        let topText: String!
        let bottomText: String!
        let originalImage: UIImage!
        let memedImage: UIImage!
    }
    
    var meme: Meme!
    
    let pickerController = UIImagePickerController()
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.imagePickerView.contentMode = UIView.ContentMode.scaleAspectFit
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        subscribeToKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageSelector.isTranslucent = true
        self.shareAndSaveBar.isTranslucent = true
        
        self.view.backgroundColor = UIColor.black
        
        imagePickerView.backgroundColor = UIColor.black
        imagePickerView.translatesAutoresizingMaskIntoConstraints =  false
        //imagePickerView.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width) - 50, height: (4 * Int(self.view.frame.height))/5)
        imagePickerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        imagePickerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        imagePickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imagePickerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imagePickerView.bottomAnchor.constraint(equalTo: self.imageSelector.topAnchor).isActive = true
        //imagePickerView.center = self.view.center
        imagePickerView.contentMode = .scaleAspectFit
        
        self.pickerController.delegate = self
        
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        
        self.topTextField.memeTextFieldLayoutAndAttributes(view: self.view, text: "TOP", placeholder: "", topOrBottomPosition: "top")
        
        self.bottomTextField.memeTextFieldLayoutAndAttributes(view: self.view, text: "BOTTOM", placeholder: "", topOrBottomPosition: "bottom")
        
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(_ notification:Notification) {
    
        if bottomTextField.isEditing {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        
        view.frame.origin.y = 0
        
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
    
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    
    }
    
    @IBAction func pickAnImageFromCamara(_ sender: Any) {
        
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func save() -> Meme {
        // Create the meme
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imagePickerView.image!, memedImage: generateMemedImage())
        
        return meme
    }
    
    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        self.imageSelector.isHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // TODO: Show toolbar and navbar
        self.imageSelector.isHidden = false
        
        return memedImage
    }
    
}

extension UITextField {
    
    func memeTextFieldLayoutAndAttributes(view: UIView, text: String, placeholder: String, topOrBottomPosition: String){
        
        self.translatesAutoresizingMaskIntoConstraints = false

        
        if topOrBottomPosition == "top" {
            
            //height = (height/4)
            self.centerYAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, constant: CGFloat(-view.frame.width) / 4).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
        }
        else if topOrBottomPosition == "bottom" {
            
            //height = ((3 * height) / 5)
            self.centerYAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: CGFloat(view.frame.width) / 4).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
        }
        
        self.text = text
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)
        self.defaultTextAttributes[.strokeColor] = UIColor.black
        self.defaultTextAttributes[.strokeWidth] = -7
        self.borderStyle = .none
        self.placeholder = placeholder
        self.autocapitalizationType = .allCharacters
        self .autocorrectionType = .no
    }
}
