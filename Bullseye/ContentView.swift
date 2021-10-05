//
//  ContentView.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("PLACE THE BULLSEYE AS CLOSE AS YOU CAN")
        .font(.footnote)
        .kerning(2.0)
        .bold()
        .lineSpacing(5)
        .multilineTextAlignment(.center)
      
      Text("89")
        .font(.title)
        .bold()
      
      HStack {
        Text("1")
          .bold()
        Slider(value: .constant(32), in: 1.0...100.0)
        Text("100")
          .bold()
      }
      
      Button(action: {}) {
        Text("Hit me")
          .bold()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
  }
}
