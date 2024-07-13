//
//  View_Glow.swift
//
//
//  Created by Eda Barutçu on 13.07.2024.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension View {
  func glow(color: Color = .gray, radius: CGFloat = 20) -> some View {
    self
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
  }
}

