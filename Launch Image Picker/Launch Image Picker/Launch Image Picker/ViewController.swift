//
//  ViewController.swift
//  Launch Image Picker
//
//  Created by Jose Ramos on 3/10/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func exeperiment(sender: UIButton){
        
        let nextController = UIImagePickerController()
        self.present(nextController, animated: true, completion: nil)
        
    }
    
    @IBAction func experiment2(sender: UIButton){
        
        let controller = UIAlertController()
        
        controller.title = "Test Alert"
        controller.message = "This is a test"
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in self.dismiss(animated: true, completion: nil)
        })

        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func experiment3(sender: UIButton)
    {
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        
    }
}

