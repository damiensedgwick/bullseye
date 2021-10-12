//
//  InstructionsView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 12/10/2021.
//

import SwiftUI

struct InstructionsView: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      InstructionText(text: "Place the bullseye as close as you can")
        .padding(.init(top: 0, leading: 30.0, bottom: 0, trailing: 30.0))

      BigNumberText(text: String(game.targetValue))
    }
  }
}

struct InstructionsView_Previews: PreviewProvider {
  @Binding var game

  static var previews: some View {
    InstructionsView(game: $game)
  }
}
