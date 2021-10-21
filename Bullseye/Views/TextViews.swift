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

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    InstructionText(text: "Instructions")
    BigNumberText(text: "999")
    SliderLabelText(text: "100")
    SliderLabelText(text: "Score".uppercased())
  }
}
