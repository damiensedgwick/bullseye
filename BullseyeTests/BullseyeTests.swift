//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Damien K. Sedgwick on 10/10/2021.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
  
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.targetValue + 5
    let score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 95)
  }

  func testScoreNegative() {
    let guess = game.targetValue - 5
    let score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 95)
  }

  func testScoreExact() {
    let guess = game.targetValue
    let score = game.points(sliderValue: guess)

    XCTAssertEqual(score, 200)
  }

  func testScoreClose() {
    let guess = game.targetValue + 2
    let score = game.points(sliderValue: guess)

    XCTAssertEqual(score, 98 + 50)
  }

  func testNewRound() {
    game.startNewRound(points: 100)

    XCTAssertEqual(game.totalScore, 100)
    XCTAssertEqual(game.currentRound, 2)
  }

  func testRestart() {
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.totalScore, 0)
    XCTAssertNotEqual(game.currentRound, 1)

    game.restartGame()

    XCTAssertEqual(game.totalScore, 0)
    XCTAssertEqual(game.currentRound, 1)
  }

  func testLeaderboard() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    XCTAssertEqual(game.leaderboardEntries[0].score, 100)

    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
    XCTAssertEqual(game.leaderboardEntries[0].score, 200)
    XCTAssertEqual(game.leaderboardEntries[1].score, 100)
  }
}
