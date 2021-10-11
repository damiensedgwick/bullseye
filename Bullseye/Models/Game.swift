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
    100 - abs(targetValue - sliderValue)
  }
}
