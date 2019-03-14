//
//  ViewController.swift
//  Color Maker with Sliders
//
//  Created by Jose Ramos on 3/5/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.redControl.minimumValue = 0.0
        self.redControl.maximumValue = 1.0
        self.redControl.value = 0
        
        self.greenControl.minimumValue = 0.0
        self.greenControl.maximumValue = 1.0
        self.greenControl.value = 0
        
        self.blueControl.minimumValue = 0.0
        self.blueControl.maximumValue = 1.0
        self.blueControl.value = 0
        
        changeColorComponent(colorView)
        
        //self.view.backgroundColor = UIColor.black
        
    }
    
    @IBAction func changeColorComponent(_ sender: AnyObject) {
        
        //let initialValue: Float
        let r: CGFloat = CGFloat(self.redControl.value)
        print(self.redControl.value)
        let g: CGFloat = CGFloat(self.greenControl.value)
        print(self.greenControl.value)
        let b: CGFloat = CGFloat(self.blueControl.value)
        print(self.blueControl.value)
        
        colorView.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        
    }
    
//    func changeRect() {
//        colorView
//        
//    }

}

