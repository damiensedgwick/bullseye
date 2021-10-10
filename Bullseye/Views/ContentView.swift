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
    VStack {
      Text("PLACE THE BULLSEYE AS CLOSE AS YOU CAN")
        .font(.footnote)
        .kerning(2.0)
        .bold()
        .lineSpacing(5)
        .multilineTextAlignment(.center)
      
      Text(String(game.targetValue))
        .font(.largeTitle)
        .fontWeight(.black)
        .kerning(-1.0)
      
      HStack {
        Text("1")
          .bold()
        
        Slider(value: self.$sliderValue, in: 1.0...100.0)
        
        Text("100")
          .bold()
      }
      
      Button(action: {
        self.isAlertVisible = true
      }) {
        Text("Hit me")
          .bold()
      }
      .alert(isPresented: $isAlertVisible, content: {
        
        let roundedValue = Int(self.sliderValue.rounded())
        
        return Alert(title: Text("Hello There!"), message: Text("The slider value is: \(roundedValue).\n" + "You scored: \(self.game.points(sliderValue: roundedValue))"))
      })
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
  }
}
