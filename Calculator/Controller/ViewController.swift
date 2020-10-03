//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!

    private var isFinishedTypingNumber = true

    private var calculator = CalculatorLogic()

    private var displayValue: Double {
        get {
            guard let currentDisplayName = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to double")
            }
            return currentDisplayName
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true

        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            guard let result = calculator.calcurate(symbol: calcMethod) else {
                fatalError("Result of calcurator is nil")
            }

            displayValue = result
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                isFinishedTypingNumber = false
                displayLabel.text = numValue
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue

                    if !isInt {
                        return
                    }
                }

                displayLabel.text?.append(numValue)
            }
        }
    }
}
