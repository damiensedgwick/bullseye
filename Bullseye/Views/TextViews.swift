//
//  TextViews.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 12/10/2021.
//

import SwiftUI

struct InstructionText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .font(.title3)
      .kerning(2.0)
      .bold()
      .lineSpacing(5)
      .multilineTextAlignment(.center)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.largeTitle)
      .fontWeight(.black)
      .kerning(-1.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35.0)
  }
}

struct LabelText: View {
  var text: String

  var body: some View {
    Text(text)
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))

  }
}

struct BodyText: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .lineSpacing(12.0)
      .multilineTextAlignment(.center)
  }
}

struct ButtonText: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.headline)
      .fontWeight(.bold)
      .padding()
      .foregroundColor(Color("ButtonTextColor"))
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .cornerRadius(Constants.General.roundedRectCornerRadius)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "1")
      SliderLabelText(text: "100")
      BodyText(text: "You scored 200 points \n 🎉🎉🎉")
      ButtonText(text: "Start New Round")
    }
    .padding()
  }
}
