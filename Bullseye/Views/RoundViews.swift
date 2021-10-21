//
//  RoundViews.swift
//  Bullseye
//
//  Created by Damien K. Sedgwick on 12/10/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56, height: 56)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: 56, height: 56)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundRectText: View {
  var text: String

  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: 68.0, height: 56.0)
      .overlay(
        RoundedRectangle(cornerRadius: 21.0)
          .stroke(lineWidth: 2.0)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}



struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10.0) {
      RoundedImageViewStroked(systemName:"arrow.counterclockwise")
      RoundedImageViewFilled(systemName:"list.dash")
      RoundRectText(text: "999")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
