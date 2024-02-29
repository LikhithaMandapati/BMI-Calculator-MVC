//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Likhitha Mandapati on 2/28/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI (feet : Int, inch : Int, weight : Float) {
        let height = Float(feet * 12 + inch)
        let bmiValue = (weight * 703) / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemBlue)
        } else if bmiValue < 24.5 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat fewer pies", color: UIColor.systemPink)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f",bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
