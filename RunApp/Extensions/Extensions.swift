//
//  Extensions.swift
//  RunApp
//
//  Created by Can Haskan on 24.11.2025.
//

import Foundation

extension Double {
    func roundedNumber (to places: Int) -> Double {
        let km = self / 1000.0
        let divisor = pow(10.0, Double(places))
        return (km  * divisor).rounded() / divisor
        
    }
}

extension Int {
    func formatTimeDurationToString() -> String {
        let durationHours = self / 3600
        let durationMinutes = (self % 3600) / 60
        let durationSeconds = (self % 3600) % 60
        
        if durationSeconds < 0 {
            return "00:00:00"
        } else {
            if durationHours == 0 {
                return String(format: "%02d:%02d", durationMinutes, durationSeconds)
            } else {
                return String(format: "%02d:%02d:%02d", durationHours, durationMinutes, durationSeconds)
            }
        }
    }
}
