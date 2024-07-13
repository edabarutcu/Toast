//
//  ToastModifier.swift
//
//
//  Created by Eda Barutçu on 13.07.2024.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct ToastModifier: ViewModifier {
  
  @Binding var toast: Toast?
  @State private var workItem: DispatchWorkItem?
  
    @available(iOS 14.0, *)
    func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        ZStack {
          mainToastView()
            .offset(y: 700)
        }.animation(.spring(), value: toast)
      )
      .onChange(of: toast) { value in
        showToast()
      }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      VStack {
        ToastView(
          style: toast.style,
          message: toast.message,
          width: toast.width
        ) {
          dismissToast()
        }
        Spacer()
      }
    }
  }
  
  public func showToast() {
    guard let toast = toast else { return }
      playSystemSound() 

    UIImpactFeedbackGenerator(style: .light)
      .impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation {
      toast = nil
    }
    
    workItem?.cancel()
    workItem = nil
  }
}
