//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 1101373 on 2020/10/01.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number : Double
    
    init(number : Double) {
        self.number = number
    }
    
    func calcurate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "%" {
            return number / 100
        } else if symbol == "AC" {
            return 0
        }
        return nil
    }
}
