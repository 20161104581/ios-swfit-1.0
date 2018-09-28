//
//  ViewController.swift
//  ios swfit
//
//  Created by 20161104581 on 2018/9/26.
//  Copyright © 2018年 20161104581. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appendDigit: UIButton!
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var operate: UIButton!
    
    var userIsInTheMiddleOfTypingANumber:Bool = false
    
    @IBAction func appendDigit(sender: UIButton){
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    //对数字进行运算
    
    
   
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        switch operation{
            /*swift算法极为简洁，当调用方法performOperation时，其自动对比方法的参数，而无需在
             *调用方法时写明参数类型，例如，这里的参数$0 与 $1并没有指明类型，而Swift会直接将其适应为
             *方法performOpetation中的Double型
             */
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        default: break
            
        }
    }
    
    //两个参数进行运算的方法
    func performOperation(operation: (Double,Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
        
    }
    
    //一个参数进行运算的方法，Swift支持方法的重载，但Obj-C不允许，这里继承了Obj-C的
    //类UIViewColler，不能重载方法performOperation，故将其变为Private方法
    private func performOperation(operation: (Double) -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
        
    }
    var operandStack = Array<Double>()
    
    //若用户点击enter，则将相应数字添加至数组Array中
    
    
  
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    var displayValue: Double {
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

   
   

    
    


