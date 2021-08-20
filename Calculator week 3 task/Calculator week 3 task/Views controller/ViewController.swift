//
//  ViewController.swift
//  Calculator week 3 task
//
//  Created by  Decagon on 18/07/2021.
//

import UIKit
//MARK -- enum
enum Operations: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case empty = "empty"
}

class ViewController: UIViewController {
    //MARK -- empty variable
    var waitingNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operations = .empty

    @IBOutlet weak var outputLabel: UILabel! //label variable
    //MARK -- viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
    }
//MARK -- button press function
    @IBAction func buttonPressed(_ sender: RoundButton) {
        if waitingNumber.count <= 9 {
            waitingNumber += "\(sender.tag)"
            outputLabel.text = waitingNumber
        }
    }
    //MARK -- function to clear the calculation back to 0 AC.
    @IBAction func allClearPressed(_ sender: RoundButton) {
        waitingNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .empty
        outputLabel.text = "0"
    }
    //MARK-- dot press function
    @IBAction func dotPressed(_ sender: RoundButton) {
        if waitingNumber.contains(".") {
            outputLabel.text = waitingNumber
        } else {
            if waitingNumber.count <= 8 {
                waitingNumber += "."
                outputLabel.text = waitingNumber
            }
        }
    }
    //MARK-- equal function for equal(=) button
    @IBAction func equalPressed(_ sender: RoundButton) {
        doOperation(operation: currentOperation)
    }
    //MARK-- ADD Function for add(+) button
    @IBAction func addPressed(_ sender: RoundButton) {
        doOperation(operation: .add)
    }
    //MARK-- SUBTRACT Function for (-) button
    @IBAction func subtractPressed(_ sender: RoundButton) {
        doOperation(operation: .subtract)
    }
    //MARK-- MULTIPLY Function for (*) button
    @IBAction func mulyiplyPressed(_ sender: RoundButton) {
        doOperation(operation: .multiply)
    }
    //MARK-- DIVIDE Function for (÷) button
    @IBAction func dividePressed(_ sender: RoundButton) {
        doOperation(operation: .divide)
    }
    @IBAction func percentagePressed(_ sender: RoundButton) {
    
    }
    //MARK-- doOperation Function that perform the calculation
    func doOperation(operation: Operations) {
        if currentOperation != .empty {
            if waitingNumber != ""{
                rightValue = waitingNumber
                waitingNumber = ""
                if currentOperation == .add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)" // addition
                } else if currentOperation == .subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)" // subtraction
                } else if currentOperation == .multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)" //multiplication
                } else if currentOperation == .divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"  //Division
                }
                leftValue  = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        }
        else {
            leftValue = waitingNumber
            waitingNumber = ""
            currentOperation = operation
        }
    }
}





