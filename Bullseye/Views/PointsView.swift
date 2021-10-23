//
//  PointsView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 22/10/2021.
//

import SwiftUI

struct PointsView: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)

    VStack(spacing: 10) {
      InstructionText(text: "The sliders value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You score \(points) Points \n 🎉🎉🎉")
      Button(action: {
        withAnimation {
          isAlertVisible.toggle()
        }
        game.startNewRound(points: points)
      }, label: {
        ButtonText(text: "Start New Round")
      })
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21.0)
    .shadow(radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {

  static private var isAlertVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())

  static var previews: some View {
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.landscapeRight)

    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.portrait)

    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeRight)

    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
  }
}
