//
//  ViewController.swift
//  3Calculator
//
//  Created by Karolis Kolbus on 20/05/2015.
//  Copyright (c) 2015 Karolis Kolbus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var userIsInTheMiddleOfTypingSomething = false
    var arrayOfNumbers = [Double]()
  

    @IBOutlet weak var display: UILabel!
    
    var doubleNumber: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    
    func operationButtonPressed(sender: (Double, Double) -> Double) {
        if arrayOfNumbers.count >= 2 {
            doubleNumber = sender(arrayOfNumbers.removeLast(), arrayOfNumbers.removeLast())
        }
        returnButton()
    }
    
    func squareRootButtonPressed(sender: Double -> Double) {
        if arrayOfNumbers.count >= 1 {
            doubleNumber = sender(arrayOfNumbers.removeLast())
        }
        returnButton()
    }

    
    @IBAction func digitPressed(sender: UIButton) {
        if userIsInTheMiddleOfTypingSomething {
            display.text = display.text! + sender.currentTitle!
        } else {
        display.text = sender.currentTitle
            userIsInTheMiddleOfTypingSomething = true
        }
    }
 
    @IBAction func performOperation(sender: UIButton) {
        var operationTitle = sender.currentTitle!
        if userIsInTheMiddleOfTypingSomething {
            returnButton()
        }
    
        switch operationTitle {
        case "✕": operationButtonPressed(*)
        case "÷": operationButtonPressed({ $1 / $0 })
        case "+": operationButtonPressed(+)
        case "−": operationButtonPressed({ $1 - $0} )
        case "√": squareRootButtonPressed(sqrt)
        default: break
        }
    }

    @IBAction func decimalButton() {
        if display.text!.rangeOfString(".") != nil {
            display.text = display.text
        } else {
            if userIsInTheMiddleOfTypingSomething {
                display.text = display.text! + "."
            } else {
                display.text = "0."
            }
        }
    }
    
    @IBAction func clearButton() {
        arrayOfNumbers.removeAll()
        display.text = "0"
        userIsInTheMiddleOfTypingSomething = false
    }
    
    
    @IBAction func returnButton() {
        arrayOfNumbers.append(doubleNumber)
        userIsInTheMiddleOfTypingSomething = false
    }
}

