//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Himanshu Matharu on 2022-04-07.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation : (n1:Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> (result:Double?,calc:String?){
        
        if let n = number {
            if symbol == "+/-" {
                return (n * -1,"")
            } else if symbol == "C" {
                return  (0,"")
            } else if symbol == "%" {
                return (n * 0.01,"")
            }else if symbol == "=" {
                return performTwoNumCalculation(n2:n)
            }else{
                self.intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return (nil,"")
    }
    
    private func performTwoNumCalculation(n2:Double) -> (Double?,String?){
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            if operation == "+" {
                return (n1 + n2,String(n1)+"+"+String(n2))
            }else if operation == "-" {
                return (n1 - n2,String(n1)+"-"+String(n2))
            }else if operation == "×" {
                return (n1 * n2,String(n1)+"×"+String(n2))
            }else if operation == "/" {
                return (n1 / n2,String(n1)+"/"+String(n2))
            }else{
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        
        return (nil,"")
        
    }
    
}
