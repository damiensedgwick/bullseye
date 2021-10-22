//
//  Game.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 10/10/2021.
//

import Foundation

struct Game {
  var targetValue: Int = Int.random(in: 1...100)
  var totalScore: Int = 0
  var currentRound: Int = 1
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(targetValue - sliderValue)
    let bonus: Int

    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    
    return 100 - difference + bonus
  }

  mutating func startNewRound(points: Int) {
    totalScore += points
    currentRound += 1
    targetValue = Int.random(in: 1...100)
  }

  mutating func restartGame() {
    totalScore = 0
    currentRound = 1
    targetValue = Int.random(in: 1...100)
  }
}
