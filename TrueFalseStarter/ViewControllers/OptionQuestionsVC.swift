//
//  OptionQuestionsVC.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class OptionQuestionsVC: UIViewController {
    
    //FIXME: Stop timer when user enters this screen
    
    // MARK: Outles
    @IBOutlet weak var emptySpace: UILabel!
    @IBOutlet weak var threeOptionQuestionsButton: UIButton!
    @IBOutlet weak var fourOptionQuestionsButton: UIButton!
    
    
    // MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptySpace.text = ""
        
        // Buttons Corner Radius
        threeOptionQuestionsButton.layer.cornerRadius = 6
        fourOptionQuestionsButton.layer.cornerRadius = 6
        
        // Buttons Alpha color
        threeOptionQuestionsButton.alpha = 1.0
        fourOptionQuestionsButton.alpha = 1.0
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func threeOptionTrivia(_ sender: Any) {
        
        //ViewController.displayQuestion(ViewController).
        
        //TriviaModel().
        
        
        return print("3 options")
    }
    
}
