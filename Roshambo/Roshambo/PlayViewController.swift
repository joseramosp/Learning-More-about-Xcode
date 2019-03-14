//
//  ViewController.swift
//  Roshambo
//
//  Created by Jose Ramos on 3/14/19.
//  Copyright © 2019 Jose Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var paper: Int = 1
    var rock: Int = 2
    var scissors: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func randomComputerOption() -> Int {
        let randomNum = 1 + arc4random() % 3
        return Int(randomNum)
    }
    
    @IBAction func rockPressed() {
        let player = rock
        let computer = randomComputerOption()
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        
        if player == computer{
            controller.gameText = "It's a tie!"
            controller.imageName = "itsATie"
        }
        else if computer == paper{
            controller.gameText = "Papar covers rock. You lost!"
            controller.imageName = "PaperCoversRock"
        }
        else {
            controller.gameText = "Rock crushes scissors. You win!"
            controller.imageName = "RockCrushesScissors"
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperPressed() {
        let player = paper
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        
        
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func scissorsPressed() {
        let player = scissors
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        
        
        
        present(controller, animated: true, completion: nil)
    }
}

