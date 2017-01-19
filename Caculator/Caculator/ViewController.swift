//
//  ViewController.swift
//  Caculator
//
//  Created by Fu, Zishan on 1/18/17.
//  Copyright © 2017 Fu, Zishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var op1 = ""    // + - * /
    var opForFirstNum = false // %
    var opForSecondNum = false // %
    var negOpCount = 0 // +/-
    var firstNum = ""
    var secondNum = ""
    var clear = false
	var isOp = false
		
    @IBOutlet var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Operator( opButton: UIButton) {
        if clear==true{
            textView.text = ""
        }
        clear = false
        let op = (opButton.titleLabel?.text)!
        switch op{
        case "+","-","X","/":
            isOp = true
            clear = true
            op1 = op
            break
        case "=":
            let result = caculator()
            if(negOpCount%2==1){
                textView.text = "-\(result)"
            }else{textView.text = "\(result)"}
            negOpCount = 0
            break
        case "+/-":
            textView.text = "-"+textView.text!
            negOpCount += 1
            break
        case "%":
            let perc = Double(textView.text!)
            let percNum = perc!*0.01
            textView.text = "\(percNum)";
            if isOp==false {
                opForFirstNum = true
            }else{
                opForSecondNum = true
            }
            break
        case ".":
            if isOp==false {
                firstNum = textView.text!+op
                textView.text = textView.text!+op
            }else{
                secondNum = textView.text!+op
                textView.text = textView.text!+op
            }
            break
        case "C":
            textView.text = ""
            clear = false
            break
        default:
            if isOp==false {
                firstNum = textView.text!+op
                textView.text = textView.text!+op
            }else{
                secondNum = textView.text!+op
                textView.text = textView.text!+op
            }
            break
        }
    }
    
    
    func caculator() -> Double {
    var opFirst = 1.0
    var opSecond = 1.0
    let first = Double(firstNum)!
    let second = Double(secondNum)!
    if opForFirstNum == true {
        opFirst = 0.01
    }
    if opForSecondNum == true {
        opSecond = 0.01
    }
    firstNum = " "
    secondNum = " "
    isOp = false
    opForFirstNum = false
    opForSecondNum = false
    negOpCount = 0
    switch op1 {
    case "+":
        return first * opFirst + second * opSecond
    case "-":
        return first * opFirst - second * opSecond
    case "X":
        return first * opFirst * second * opSecond
    case "/":
        return first * opFirst/second * opSecond
    default:
        return 0
}
}

}

