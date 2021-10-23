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
      .frame(width: Constants.General.roundedViewLength, height:Constants.General.roundedRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
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
      .frame(width:  Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
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
