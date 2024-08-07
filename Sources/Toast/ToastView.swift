//
//  ToastView.swift
//
//
//  Created by Eda Barutçu on 13.07.2024.
//

import SwiftUI

struct ToastView: View {
  
  var style: ToastStyle
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
    @available(iOS 13.0.0, *)
    var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
        .foregroundColor(style.themeColor)
      Text(message)
        .font(Font.caption)
        .foregroundColor(Color("toastForeground"))
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(Color("toastBackground"))
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(style.themeColor, lineWidth: 4)
        .opacity(0.6)
    )
    .padding(.horizontal, 16)
  }
}

struct FancyToastView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        VStack(spacing: 32) {
            ToastView(style: .success, message: "Success message") {}
            ToastView(style: .info, message: "Info message") {}
            ToastView(style: .warning, message: "Warning message") {}
            ToastView(style: .error, message: "Error message") {}
            ToastView(style: .loading, message: "Loading...") {} 
            ToastView(style: .pending, message: "Your action is pending...") {}
            ToastView(style: .neutral, message: "This is a neutral message") {}


        }
    }
}
struct FancyToastViewDark_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
    VStack(spacing: 32) {
      ToastView(
        style: .success,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .info,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .warning,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .error,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
        ToastView(style: .loading, message:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
        ToastView(style: .pending, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
        ToastView(style: .neutral, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.") {}

    }
    .preferredColorScheme(.dark)
  }
}
