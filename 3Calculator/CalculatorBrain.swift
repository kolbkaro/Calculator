//
//  CalculatorBrain.swift
//  3Calculator
//
//  Created by Karolis Kolbus on 24/05/2015.
//  Copyright (c) 2015 Karolis Kolbus. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var arrayOfNumbers = [Double]()
    
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

    }
