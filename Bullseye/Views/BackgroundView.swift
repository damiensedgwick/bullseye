//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 21/10/2021.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShowing = false

  var body: some View {
    HStack {
      Button(action: {
        game.restartGame()
      }) {
        RoundedImageViewStroked(systemName:"arrow.counterclockwise")
      }

      Spacer()

      Button(action: {
        leaderboardIsShowing = true
      }) {
        RoundedImageViewFilled(systemName:"list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}) {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      }
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String

  var body: some View {
    VStack(spacing: 5) {
      LabelText(text: title.uppercased())
      RoundRectText(text: text)
    }
  }
}

struct BottomView: View {
  @Binding var game: Game

  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.totalScore))
      Spacer()
      NumberView(title: "Round", text: String(game.currentRound))
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      ForEach(1 ..< 6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3

        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
    BackgroundView(game: .constant(Game()))
      .previewInterfaceOrientation(.landscapeRight)
  }
}
