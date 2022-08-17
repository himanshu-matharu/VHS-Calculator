//
//  Float+CleanString.swift
//  Calculator
//
//  Created by Himanshu Matharu on 2022-08-17.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
