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

    private var intermediateCalcuration: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calcurate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumberCalcuration(n2: n)
            default:
                intermediateCalcuration = (n1: n, calcMethod: symbol)
            }
        }

        return nil
    }

    private func performTwoNumberCalcuration(n2: Double) -> Double? {
        if let n1 = intermediateCalcuration?.n1, let operation = intermediateCalcuration?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2

            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }

        return nil
    }
}
