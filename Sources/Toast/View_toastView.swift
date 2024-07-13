//
//  View_toastView.swift
//
//
//  Created by Eda Barutçu on 13.07.2024.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}
