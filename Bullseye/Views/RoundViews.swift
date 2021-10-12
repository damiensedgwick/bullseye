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
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56, height: 56)
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10.0) {
      RoundedImageViewStroked(systemName:"arrow.counterclockwise")
      RoundedImageViewFilled(systemName:"list.dash")
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
