//
//  OptionQuestionsVC.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class OptionQuestionsVC: UIViewController {
    
    // MARK: Buttons & Labels

    @IBOutlet weak var emptySpace: UILabel!
    @IBOutlet weak var threeOptionQuestionsButton: UIButton!
    @IBOutlet weak var fourOptionQuestionsButton: UIButton!
    
    
    

    // MARK: App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appStartUp()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: User's Trivia Choice Display
    
    func appStartUp() {
        
        emptySpace.text = ""
        
        threeOptionQuestionsButton.layer.cornerRadius = 6
        fourOptionQuestionsButton.layer.cornerRadius = 6
        
    }

    
    
    // MARK: Actions
    
    @IBAction func threeOptionTrivia(_ sender: Any) {
        
    }
    
    @IBAction func fourOptionTrivia(_ sender: Any) {
    }
    

}
