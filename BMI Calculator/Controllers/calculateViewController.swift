//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class calculateViewController: UIViewController {
    
    var calcBrain = calculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let sliderValue = String(format: "%.2f", sender.value)
        heightLabel.text = sliderValue + "m"
    }
    
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let sliderValue = String(format: "%.0f", sender.value)
        weightLabel.text = sliderValue + "Kg"
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calcBrain.calculateBMI(height:height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult")
        {
            let destinationVC = segue.destination as! resultViewController
            destinationVC.bmiValue = calcBrain.getBMIValue()
            destinationVC.advice = calcBrain.getAdvice()
            destinationVC.color = calcBrain.getColor()
        }
    }
}
