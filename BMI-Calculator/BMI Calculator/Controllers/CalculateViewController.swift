//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Likhitha Mandapati on 2/28/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var feetLabel: UILabel!
    @IBOutlet var inchLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var feetSlider: UISlider!
    @IBOutlet var inchSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func feetSliderChanged(_ sender: UISlider) {
        let feet = String(format: "%.0f", sender.value)
        feetLabel.text = "\(feet)ft"
    }
    @IBAction func inchSliderChanged(_ sender: UISlider) {
        let inch = String(format: "%.0f", sender.value)
        inchLabel.text = "\(inch)in"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)lbs"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let feet = String(format: "%.0f", feetSlider.value)
        let inch = String(format: "%.0f", inchSlider.value)
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(feet: Int(feet)!, inch: Int(inch)!, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}
