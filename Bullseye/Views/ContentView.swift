//
//  ContentView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var isAlertVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, isAlertVisible ? 0 : 100)

        if isAlertVisible {
          PointsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else  {
          HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }

      if !isAlertVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

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

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: self.$sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding(.init(top: 0, leading: 25.0, bottom: 0, trailing: 25.0))
  }
}

struct HitMeButton: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    Button(action: {
      withAnimation {
        isAlertVisible.toggle()
      }
    }) {
      Text("Hit me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .foregroundColor(Color.white)
    .cornerRadius(21.0)
    .overlay(
      RoundedRectangle(cornerRadius: 21.0)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
    
    ContentView()
    
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeRight)
    
    ContentView()
      .preferredColorScheme(.dark)
  }
}
