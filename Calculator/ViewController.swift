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

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true

        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to double")
        }

        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                isFinishedTypingNumber = false
                displayLabel.text = numValue
            } else {
                displayLabel.text?.append(numValue)
            }
        }
    }
}
