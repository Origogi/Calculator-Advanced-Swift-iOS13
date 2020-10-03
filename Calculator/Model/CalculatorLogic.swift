//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 1101373 on 2020/10/01.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    func calcurate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "AC" {
                return 0
            } else if symbol == "+" {
                return 0
            } else if symbol == "=" {
                return 0
            }
        }

        return nil
    }
}
