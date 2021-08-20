//
//  roundView.swift
//  Calculator week 3 task
//
//  Created by  Decagon on 18/07/2021.
//

import UIKit


//Round button class
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override  func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
