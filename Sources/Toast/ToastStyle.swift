//
//  ToastStyle.swift
//
//
//  Created by Eda Barutçu on 13.07.2024.
//

import Foundation
import SwiftUI

enum ToastStyle {
  case error
  case warning
  case success
  case info
  case loading

}

extension ToastStyle {
    @available(iOS 13.0, *)
    var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    case .loading: return Color.gray

    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    case .loading: return "hourglass"
    }
  }
}
