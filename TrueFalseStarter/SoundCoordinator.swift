//
//  SoundCoordinator.swift
//  TrueFalseStarter
//
//  Created by Luis Vega on 12/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox

class SoundCoordinator {
    
    var gameSound: SystemSoundID = 0
    var wrongAnswerSound: SystemSoundID = 0
    var correctAnswerSound: SystemSoundID = 0
    
    init() {
        loadGameStartSound()
        loadCorrectAnswerSound()
        loadIncorrectAnswerSound()
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func loadCorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    func loadIncorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "WrongAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
    }
    
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
    
}
