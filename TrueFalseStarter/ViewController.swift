//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: Properties
    
    // Global Variables & Constants
    
    // Set of required questions asked per round
    let questionsPerRound: Int = 4
    
    // Variables asked and correction questions per round
    var questionsAsked = 0
    var correctQuestions = 0
    
    // Sound
    var gameSound: SystemSoundID = 0
    
    // Labels
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var messageField: UILabel!
    
    
    // Buttons
    // FIXME: convert true/false buttons to choice 1,2,3,4 buttons
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    
    // FIXME: Convert playAgainButton to a nextQuestionAndPlayAgainButton
    
    @IBOutlet weak var nextQuestionAndPlayAgainButton: UIButton!
    

    
    // MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        
        // Start game
        playGameStartSound()
        initialAppSetUp()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Game Setup
    func initialAppSetUp() {
        // Hide
        messageField.isHidden = true
        
        // FIXME: Convert playAgainButton to a nextQuestionAndPlayAgainButton
        nextQuestionAndPlayAgainButton.isHidden = true
        
        // Show Buttons
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        choiceThree.isHidden = false
        choiceFour.isHidden = false
        
        // Buttons Corner Radius
        choiceOne.layer.cornerRadius = 6
        choiceTwo.layer.cornerRadius = 6
        choiceThree.layer.cornerRadius = 6
        choiceFour.layer.cornerRadius = 6
        
        // FIXME: Convert playAgainButton to a nextQuestionAndPlayAgainButton
        nextQuestionAndPlayAgainButton.layer.cornerRadius = 6
        
        // Buttons Alpha color
        choiceOne.alpha = 1.0
        choiceTwo.alpha = 1.0
        choiceThree.alpha = 1.0
        choiceFour.alpha = 1.0
        
        generateQuestionsToIndex()
    }
    
    
    // MARK: Display fucntions
    
    func displayQuestion() {
       selectNextQuestion()
        
        questionField.text = questions[indexOfQuestions].question
        
        choiceOne.setTitle(questions[indexOfQuestions].choices[1], for: .normal)
        choiceTwo.setTitle(questions[indexOfQuestions].choices[2], for: .normal)
        choiceThree.setTitle(questions[indexOfQuestions].choices[3], for: .normal)
        choiceFour.setTitle(questions[indexOfQuestions].choices[4], for: .normal)
        
        nextQuestionAndPlayAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
        choiceFour.isHidden = true
        
        // Display play again button
        nextQuestionAndPlayAgainButton.isHidden = false
        nextQuestionAndPlayAgainButton.setTitle("Play Again?", for: .normal)
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    
    
    // MARK: IBActions

    @IBAction func checkingAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let correctAnswer = questions[indexOfQuestions].answer
        
        if (sender === choiceOne &&  correctAnswer == 1) || (sender === choiceTwo &&  correctAnswer == 2) || (sender === choiceThree &&  correctAnswer == 3) || (sender === choiceFour &&  correctAnswer == 4) {
            correctQuestions += 1
            
            messageField.isHidden = false
            messageField.textColor = UIColor.green
            messageField.text = "Correct!"
            
            choiceOne.alpha = 0.5
            choiceTwo.alpha = 0.5
            choiceThree.alpha = 0.5
            choiceFour.alpha = 0.5
            
            sender.alpha = 1.0
        } else {
            messageField.isHidden = false
            messageField.textColor = UIColor.orange
            messageField.text = "Sorry, wrong answer!"
        }
        
        // FIXME: nextQuestionAndPlayAgainButton, change text to "next question"
        
        nextQuestionAndPlayAgainButton.setTitle("Next Question", for: .normal)
        nextQuestionAndPlayAgainButton.isHidden = false
        
        //loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            
            // FIXME: nextQuestionAndPlayAgainButton
            nextQuestionAndPlayAgainButton.setTitle("Play Again?", for: .normal)
            nextQuestionAndPlayAgainButton.isHidden = false
            
            
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        choiceThree.isHidden = false
        choiceFour.isHidden = false
        
        messageField.isHidden = true
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

