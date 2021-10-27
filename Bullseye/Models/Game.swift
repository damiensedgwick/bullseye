//
//  Game.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 10/10/2021.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var targetValue: Int = Int.random(in: 1...100)
  var totalScore: Int = 0
  var currentRound: Int = 1
  var leaderboardEntries: [LeaderboardEntry] = []

  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 125, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
    }
  }

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

  mutating func addToLeaderboard(point: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }

  mutating func startNewRound(points: Int) {
    totalScore += points
    currentRound += 1
    targetValue = Int.random(in: 1...100)
    addToLeaderboard(point: points)
  }

  mutating func restartGame() {
    totalScore = 0
    currentRound = 1
    targetValue = Int.random(in: 1...100)
  }
}
