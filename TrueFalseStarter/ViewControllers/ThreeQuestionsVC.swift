//
//  ThreeQuestionsVC.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ThreeQuestionsVC: UIViewController {
    
    // MARK: Properties
    
    // Global Variables & Constants
    
    // Set of required questions asked per round
    let questionsPerRound: Int = 5
    
    // Variables asked and correction questions per round
    var questionsAsked = 0
    var correctQuestions = 0
    
    // Sound
    let soundCoordinator = SoundCoordinator()
    
    // Labels
    @IBOutlet weak var questionsField: UILabel!
    @IBOutlet weak var outcomeField: UILabel!
    @IBOutlet weak var emptySpace: UILabel!
    
    // Buttons
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    @IBOutlet weak var nextQuestionB: UIButton!
    @IBOutlet weak var playAgainB: UIButton!
    
    // Timer
    var timer: Timer?
    var time = 15
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    // MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundCoordinator.playGameStartSound()
        initialAppSetUp()
        displayQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Game Setup
    func initialAppSetUp() {
        
        // Timer
        resetTimer()
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayTimer), userInfo: nil, repeats: true)
        
        // Empty Display space
        outcomeField.text = ""
        emptySpace.text = ""
        emptySpace.isHidden = false
        outcomeField.isHidden = false
        
        // Hidden Buttons
        nextQuestionB.isHidden = true
        playAgainB.isHidden = true
        
        // Turn buttons on
        choiceOne.isEnabled = true
        choiceTwo.isEnabled = true
        choiceThree.isEnabled = true
        
        // Show Buttons
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        choiceThree.isHidden = false
        
        // Buttons Corner Radius
        choiceOne.layer.cornerRadius = 6
        choiceTwo.layer.cornerRadius = 6
        choiceThree.layer.cornerRadius = 6
        nextQuestionB.layer.cornerRadius = 6
        playAgainB.layer.cornerRadius = 6
        
        
        // Buttons Alpha color
        choiceOne.alpha = 1.0
        choiceTwo.alpha = 1.0
        choiceThree.alpha = 1.0
        
        // Buttons Alpha color
        choiceOne.backgroundColor = UIColor.blue
        choiceTwo.backgroundColor = UIColor.blue
        choiceThree.backgroundColor = UIColor.blue
        
        mathGenerateQuestionsToIndex()
    }
    
    
    
    // MARK: Display fucntions
    
    func displayQuestion() {
        mathSelectNextQuestions()
        
        // Question Field label displaying question
        questionsField.text = mathQuestions[mathIndexOfQuestions].question
        
        // Display choices
        choiceOne.setTitle(mathQuestions[mathIndexOfQuestions].choices[1], for: .normal)
        choiceTwo.setTitle(mathQuestions[mathIndexOfQuestions].choices[2], for: .normal)
        choiceThree.setTitle(mathQuestions[mathIndexOfQuestions].choices[3], for: .normal)
        
        playAgainB.isHidden = true
        
    }
    
    func displayScore() {
        // Hide the answer buttons and labels
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
        timerLabel.isHidden = true
        
        // Diplsay play again button
        playAgainB.isHidden = false
        
        // Text Display when you finish trivia
        questionsField.text = "Way to go!\n\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    
    
    // MARK: IBActions
    
    // User presses a choice button
    @IBAction func checkingAnswer(_ sender: UIButton) {
        
        // Increment the questions asked counter
        questionsAsked += 1
        
        // Hides timer
        timerLabel.isHidden = true
        time = 15
        
        
        // The correct answer from the Trivia Model
        let correctAnswer = mathQuestions[mathIndexOfQuestions].answer
        
        // If user matches choice# and correctAnswer...
        if (sender === choiceOne && correctAnswer == 1) || (sender === choiceTwo && correctAnswer == 2) || (sender === choiceThree && correctAnswer == 3) {
            correctQuestions += 1
            
            emptySpace.isHidden = true
            
            // Display "Correct!"
            outcomeField.isHidden = false
            outcomeField.textColor = UIColor.green
            outcomeField.text = "Correct!"
            
            // Play correct sound
            soundCoordinator.playCorrectAnswerSound()
            
            // shadow buttons
            choiceOne.alpha = 0.5
            choiceTwo.alpha = 0.5
            choiceThree.alpha = 0.5
            
            // Turn buttons off
            choiceOne.isEnabled = false
            choiceTwo.isEnabled = false
            choiceThree.isEnabled = false
            
            // highlight user choice
            sender.alpha = 1.0
            sender.setTitleColor(UIColor.white, for: UIControlState.normal)
            
            stopTimer()
            
        } else {
            
            emptySpace.isHidden = true
            stopTimer()
            
            // Turn buttons off
            choiceOne.isEnabled = false
            choiceTwo.isEnabled = false
            choiceThree.isEnabled = false
            
            // Display "Wrong Answer!"
            outcomeField.isHidden = false
            outcomeField.textColor = UIColor.orange
            outcomeField.text = "Sorry, Wrong Answer! \n (Answer in Orange)"
            
            // Play "Wrong Answer" sound
            soundCoordinator.playIncorrectAnswerSound()
            
            
            // Highlighting the answer when user selected the wrong answer
            
            
            //choiceOne
            if ((choiceOne != nil) && correctAnswer == 1) {
                choiceOne.alpha = 1
                choiceOne.backgroundColor = UIColor.orange
                choiceOne.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceOne.alpha = 0.5
            }
            
            
            //choiceTwo
            if ((choiceTwo != nil) && correctAnswer == 2) {
                choiceTwo.alpha = 1
                choiceTwo.backgroundColor = UIColor.orange
                choiceTwo.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceTwo.alpha = 0.5
            }
            
            
            //choiceThree
            if ((choiceThree != nil) && correctAnswer == 3) {
                choiceThree.alpha = 1
                choiceThree.backgroundColor = UIColor.orange
                choiceThree.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceThree.alpha = 0.5
            }
            
        }
        
        // Next Question Button Appears
        nextQuestionB.isHidden = false
    }
    
    
    // Next Round function
    func nextRound() {
        
        // When questions are reached
        if questionsAsked == questionsPerRound {
            
            // Game is over
            displayScore()
            stopTimer()
            nextQuestionB.isHidden = true
        } else {
            
            // Continue game
            displayQuestion()
            
        }
    }
    
    
    // When user presses "Play Again" button...
    @IBAction func playAgains() {
        
        // Show the answer buttons
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        choiceThree.isHidden = false
        
        // Reset
        questionsAsked = 0
        correctQuestions = 0
        
        // Game start sound
        soundCoordinator.playGameStartSound()
        
        // call next round
        nextRound()
        
        // call app setup
        initialAppSetUp()
    }
    
    // When user presses "Next Question" button...
    @IBAction func nextQuestionA() {
        
        // call...
        initialAppSetUp()
        
        return loadNextRoundWithDelay(seconds: 0)
        
    }
    
    // MARK: Timer functions
    
    // Display timer function
    @objc func displayTimer() {
        
        time -= 1
        timerLabel.text = "\(time)"
        
        // 5...0 time label turns red
        if time <= 5 {
            timerLabel.textColor = UIColor.red
        }
        
        if time == 15 {
            
            timerLabel.isHidden = true
            
        }
        
        if time == 0 {
            
            questionsAsked += 1
            
            // Turn buttons off
            choiceOne.isEnabled = false
            choiceTwo.isEnabled = false
            choiceThree.isEnabled = false
            
            
            // Display "Time's Up!"
            outcomeField.text = "Time's Up! \n (Answer in Orange)"
            outcomeField.textColor = UIColor.yellow
            
            // Play "Wrong Answer" sound
            soundCoordinator.playIncorrectAnswerSound()
            
            // Hide labels
            timerLabel.isHidden = true
            emptySpace.isHidden = true
            
            // Display "Next Question" button
            nextQuestionB.isHidden = false
            
            
            // Highlighting the answer when user selected the wrong answer
            
            let correctAnswer = mathQuestions[mathIndexOfQuestions].answer
            
            //choiceOne
            if ((choiceOne != nil) && correctAnswer == 1) {
                choiceOne.alpha = 1
                choiceOne.backgroundColor = UIColor.orange
                choiceOne.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceOne.alpha = 0.5
            }
            
            
            //choiceTwo
            if ((choiceTwo != nil) && correctAnswer == 2) {
                choiceTwo.alpha = 1
                choiceTwo.backgroundColor = UIColor.orange
                choiceTwo.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceTwo.alpha = 0.5
            }
            
            
            //choiceThree
            if ((choiceThree != nil) && correctAnswer == 3) {
                choiceThree.alpha = 1
                choiceThree.backgroundColor = UIColor.orange
                choiceThree.setTitleColor(UIColor.white, for: UIControlState.normal)
            } else {
                choiceThree.alpha = 0.5
            }
            
        }
    }
    
    // Stops time function
    func stopTimer() {
        timer?.invalidate()
    }
    
    // Resets time function
    func resetTimer() {
        
        timer?.invalidate()
        time = 15
        timerLabel.text = "\(time)"
        timerLabel.textColor = UIColor.white
        questionsField.textColor = UIColor.white
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

}

