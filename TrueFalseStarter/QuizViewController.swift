//
//  QuizViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class QuizViewController: UIViewController {
    
    let questionsPerRound = 5
    var questionsAsked = 0
    var correctQuestions = 0
    var questionIndex : Int = 0
    var quizType: QuizType?
    
    lazy var questionsArray: [Question] = {
        
        guard let quizType = self.quizType else {
            fatalError()
        }
        
        let quiz = quizType.generateQuiz(self.questionsPerRound)
        return quiz.questionsArray
        
    }()
    
    let soundCoordinator = SoundCoordinator()
    
    // Labels
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    // Buttons
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Timer
    var timer: Timer?
    var time = 10
    @IBOutlet weak var timerLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationBarSetup()
        displayQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayCountDown), userInfo: nil, repeats: true)
        soundCoordinator.playGameStartSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    func navigationBarSetup() {
        navigationItem.hidesBackButton = true
        let quitButton = UIBarButtonItem(title: "Quit", style: .done, target: self, action: #selector(quitPressed))
        navigationItem.rightBarButtonItem = quitButton
    }
    
    @objc func quitPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - GameSetup
    
    func displayQuestion() {
        
        timerLabel.isHidden = false
        let question = questionsArray[questionIndex]
        questionField.text = question.question
        playAgainButton.isHidden = true
        
        //Answers
        choice1.setTitle(question.choicesArray[0], for: UIControlState())
        choice2.setTitle(question.choicesArray[1], for: UIControlState())
        choice3.setTitle(question.choicesArray[2], for: UIControlState())
        choice4.setTitle(question.choicesArray[3], for: UIControlState())
        
        progressLabel.isHidden = false
        progressLabel.text = "\(questionIndex + 1)/\(questionsPerRound)"
        resetTimerAndButtons()
    }
    
    func displayScore() {
        // Hide the answer buttons
        choice1.isHidden = true
        choice2.isHidden = true
        choice3.isHidden = true
        choice4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        // Hide Labels
        timerLabel.isHidden = true
        progressLabel.isHidden = true
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        timerLabel.isHidden = true
        
        let selectedQuestion = questionsArray[questionIndex]
        let correctAnswer = selectedQuestion.answer
        
        if (sender.titleLabel!.text == String(describing: correctAnswer)) {
            correctQuestions += 1
            questionField.text = "Correct!"
            soundCoordinator.playCorrectAnswerSound()
            disableButtons()
            questionIndex += 1
        } else {
            questionField.text = "Sorry, the correct answer is \(correctAnswer)!"
            soundCoordinator.playIncorrectAnswerSound()
            disableButtons()
            questionIndex += 1
        }
        
        let buttonsArray = [choice1, choice2, choice3, choice4]
        
        for button in buttonsArray {
            if button!.isHighlighted == true {
                button!.alpha = 1.0
            } else {
                button!.alpha = 0.3
            }
        }
        
        loadNextRoundWithDelay(seconds: 1)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over

            guard let quizType = quizType else {
                return
            }
            
            let newQuiz = quizType.generateQuiz(questionsPerRound)
            questionsArray = newQuiz.questionsArray
            questionIndex = 0
            
            displayScore()
            
        } else {
            // Continue game
            displayQuestion()
            let buttonsArray = [choice1, choice2, choice3, choice4]
            timerLabel.isHidden = false
            for button in buttonsArray {
                button!.alpha = 1.0
            }
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        choice1.isHidden = false
        choice2.isHidden = false
        choice3.isHidden = false
        choice4.isHidden = false
        
        soundCoordinator.playGameStartSound()
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    // MARK: - Timer & Button Setup
    
    @objc func displayCountDown() {
        
        time -= 1
        timerLabel.text = "\(time)"

        if time <= 5 {
            timerLabel.textColor = UIColor.red
        }

        if time == 0 {
            questionField.text = "Time's up!"
            timerLabel.isHidden = true
            questionsAsked += 1
            soundCoordinator.playIncorrectAnswerSound()
            disableButtons()
            loadNextRoundWithDelay(seconds: 1)
            questionField.textColor = UIColor.red
            questionIndex += 1
        }
        
    }
    
    func resetTimerAndButtons() {
        time = 10
        timerLabel.text = "\(time)"
        timerLabel.textColor = UIColor.white
        questionField.textColor = UIColor.white
        enableButtons()
    }
    
    func disableButtons() {
        choice1.isUserInteractionEnabled = false
        choice2.isUserInteractionEnabled = false
        choice3.isUserInteractionEnabled = false
        choice4.isUserInteractionEnabled = false
    }
    
    func enableButtons() {
        choice1.isUserInteractionEnabled = true
        choice2.isUserInteractionEnabled = true
        choice3.isUserInteractionEnabled = true
        choice4.isUserInteractionEnabled = true
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

