//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var calculationLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculationValue: String {
        get{
            return calculationLabel.text ?? ""
        }
        set{
            calculationLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        displayLabel.text = "0"
        calculationLabel.text = ""
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            let result = calculator.calculate(symbol: calcMethod)
            if let resultValue = result.result{
                displayValue = resultValue
            }
            if let calcValue = result.calc {
                calculationValue = calcValue
            }
            
        }
    
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        if !isFinishedTypingNumber{
            if let currentNumber = displayLabel.text {
                var newNumber = String(currentNumber.dropLast())
                if newNumber.count < 1{
                    newNumber = "0"
                    isFinishedTypingNumber = true
                }
                displayLabel.text =  newNumber
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
    
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }

}

