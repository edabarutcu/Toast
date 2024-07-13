// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}


