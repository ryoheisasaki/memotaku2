//
//  Calculator.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/02.
//

import Foundation
import UIKit

class Calculator: NSObject, NSCoding {
    
    private(set) var resultText: String = "0"
    
    private var expression = ""
    
    private var progress = ""
    
    override init() {
           super.init()
       }
       
       required convenience init?(coder aDecoder: NSCoder) {
           self.init()
           if let resultText = aDecoder.decodeObject(forKey: "resultText") as? String,
              let expression = aDecoder.decodeObject(forKey: "expression") as? String,
              let progress = aDecoder.decodeObject(forKey: "progress") as? String {
               self.resultText = resultText
               self.expression = expression
               self.progress = progress
           }
       }
       
       func encode(with aCoder: NSCoder) {
           aCoder.encode(resultText, forKey: "resultText")
           aCoder.encode(expression, forKey: "expression")
           aCoder.encode(progress, forKey: "progress")
       }
    
    func clear() {
        expression = ""
        progress = ""
        resultText = "0"
    }
    
    func number0(){
        number(value: 0)
    }
    
    func number1() {
        number(value: 1)
    }
    
    func number2() {
        number(value: 2)
    }
    
    func number3() {
        number(value: 3)
    }
    
    func number4() {
        number(value: 4)
    }
    
    func number5() {
        number(value: 5)
    }
    
    func number6() {
        number(value: 6)
    }
    
    func number7() {
        number(value: 7)
    }
    
    func number8() {
        number(value: 8)
    }
    
    func number9() {
        number(value: 9)
    }
    
    private func number(value: Int) {
        expression += String(value)
        progress += String(value)
        resultText = progress
    }
    
    func addition() {
        expression += "+"
        progress = ""
    }
    
    func subtraction() {
        expression += "-"
        progress = ""

    }
    
    func multiplication() {
        expression += "*"
        progress = ""

    }
    
    func division() {
        expression += "/"
        progress = ""

    }
    
    func equal() {
        let result = NSExpression(format: expression.expressionWithFractionDigits).expressionValue(with: nil, context: nil)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.minimumFractionDigits = 8
        
        resultText = formatter.string(from: NSNumber(value: (result as? Double) ?? 0.0)) ?? ""
    }
}
private extension String {
    var expressionWithFractionDigits: String {
        replacingOccurrences(of: "+", with: ",+,")
            .replacingOccurrences(of: "-", with: ",-,")
            .replacingOccurrences(of: "*", with: ",*,")
            .replacingOccurrences(of: "/", with: ",/,")
            .split(separator: ",")
            .map { element -> String in
                if let doubleValue = Double(element) {
                    return String(doubleValue)
                } else {
                    return String(element)
                }
            }
            .joined()
    }
    
}
