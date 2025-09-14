//
//  MeasurementFormatter+Extensions.swift
//  Weatherly
//
//  Created by Virendra Gupta on 09/09/25.
//

import Foundation

extension MeasurementFormatter {
    static func temprarture(value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        
        return formatter.string(from: temp)
    }
}
