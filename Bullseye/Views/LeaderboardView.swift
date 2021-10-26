//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 26/10/2021.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 10) {
        HeaderView()
        LabelView()
        RowView(index: 1, score: 10, date: Date())
      }
    }
  }
}

struct HeaderView: View {
  var body: some View {
    ZStack {
      BigBoldText(text: "Leaderboard")

      HStack {
        Spacer()
        Button(action: {}, label: {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        })
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(text: String(index))

      Spacer()

      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)

      Spacer()

      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(
          Color("LeaderboardRowColor"),
          lineWidth: Constants.General.strokeWidth
        )
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)

      Spacer()

      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)

      Spacer()

      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView()

    LeaderboardView()
      .previewInterfaceOrientation(.landscapeRight)
  }
}
