//
//  SoundCoordinator.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/7/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox

class SoundCoordinator {
    
    private var gameSound: SystemSoundID = 0
    private var wrongAnswerSound: SystemSoundID = 0
    private var correctAnswerSound: SystemSoundID = 0
    
    init() {
        loadGameStartSound()
        loadCorrectAnswerSound()
        loadIncorrectAnswerSound()
    }
    
    private func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    private func loadCorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    private func loadIncorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "WrongAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
        
    }
    
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }

    
}
