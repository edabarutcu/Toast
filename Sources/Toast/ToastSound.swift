//
//  ToastSound.swift
//
//
//  Created by Eda Barutçu on 14.07.2024.
//

import Foundation
import AudioToolbox

public func playSystemSound() {
    AudioServicesPlaySystemSound(1007)
}

