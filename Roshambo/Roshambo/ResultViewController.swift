//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Jose Ramos on 3/14/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var imageName: String?
    var gameText: String?
    
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = self.imageName {
            self.resultImage.image = UIImage(named: imageName)
            
        } else {
            self.resultImage.image = nil;
        }
        
        if let gameText = self.gameText {
            self.resultLabel.text = gameText
            
        } else {
            self.resultLabel.text = "";
        }
        
        self.resultImage.alpha = 0
        self.resultLabel.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.resultImage.alpha = 1
            self.resultLabel.isEnabled = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
