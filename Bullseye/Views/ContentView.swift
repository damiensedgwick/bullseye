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
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        Text("Place the bullseye as close as you can".uppercased())
          .font(.title3)
          .kerning(2.0)
          .bold()
          .lineSpacing(5)
          .multilineTextAlignment(.center)
          .foregroundColor(Color("TextColor"))
        
        Text(String(game.targetValue))
          .font(.largeTitle)
          .fontWeight(.black)
          .kerning(-1.0)
          .foregroundColor(Color("TextColor"))
        
        HStack {
          Text("1")
            .bold()
            .foregroundColor(Color("TextColor"))
          
          Slider(value: self.$sliderValue, in: 1.0...100.0)
          
          Text("100")
            .bold()
            .foregroundColor(Color("TextColor"))
        }
        .padding()
        
        Button(action: {
          self.isAlertVisible = true
        }) {
          Text("Hit me".uppercased())
            .bold()
            .font(.title3)
        }
        .padding(20.0)
        .background(ZStack {
          Color("ButtonColor")
          LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.blue]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .alert(isPresented: $isAlertVisible, content: {
          
          let roundedValue = Int(self.sliderValue.rounded())
          
          return Alert(title: Text("Hello There!"),
                       message: Text("The slider value is: \(roundedValue).\n" + "You scored: \(self.game.points(sliderValue: roundedValue))"))
        })
      }
    }
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
