//
//  ViewController.swift
//  Calculator
//
//  Created by yukihiro moriyama on 2015/03/05.
//  Copyright (c) 2015年 YukihiroMoriyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numLabel: UILabel!

    var input1: Float = 0
    var input2: Float = 0
    var syousu1: Float = 0
    var syousu2: Float = 0
    var ope: Int = 0
    var point: Int = 0
    var count: Float = 1
    var ansFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func inputNumber(x: Float) {
        if ansFlag {
            input1 = 0
            ansFlag = false
        }
        
        if ope == 0 {
            input1 = input1 * 10 + x
            numLabel.text = String(format:"%g", input1)
        } else {
            input2 = input2 * 10 + x
            numLabel.text = String(format:"%g", input2)
        }
    }
    
    func inputPoint(x: Float) {
        var tmp: Float = 0

        if ope == 0 {
            syousu1 = syousu1 + (x / pow(10.0, count))
            tmp = Float(input1) + syousu1
            numLabel.text = String(format:"%g", tmp)
        } else {
            syousu2 = (syousu2 / 10.0) + (x / 10.0)
            tmp = Float(input2) + syousu2
            numLabel.text = String(format:"%g", tmp)
        }
        count += 1

    }
    
    @IBAction func one() {
        if point == 0 {
            inputNumber(1)
        } else {
            inputPoint(1)
        }
    }
    
    @IBAction func two() {
        if point == 0 {
            inputNumber(2)
        } else {
            inputPoint(2)
        }
    }

    @IBAction func three() {
        if point == 0 {
            inputNumber(3)
        } else {
            inputPoint(3)
        }
    }
    
    @IBAction func four() {
        if point == 0 {
            inputNumber(4)
        } else {
            inputPoint(4)
        }
    }
    
    @IBAction func five() {
        if point == 0 {
            inputNumber(5)
        } else {
            inputPoint(5)
        }
    }
    
    @IBAction func six() {
        if point == 0 {
            inputNumber(6)
        } else {
            inputPoint(6)
        }
    }
    
    @IBAction func seven() {
        if point == 0 {
            inputNumber(7)
        } else {
            inputPoint(7)
        }
    }
    
    @IBAction func eight() {
        if point == 0 {
            inputNumber(8)
        } else {
            inputPoint(8)
        }
    }

    @IBAction func nine() {
        if point == 0 {
            inputNumber(9)
        } else {
            inputPoint(9)
        }
    }
    
    @IBAction func zero() {
        if point == 0 {
            inputNumber(0)
        } else {
            inputPoint(0)
        }
    }
    
    @IBAction func plus() {
        ope = 1
        point = 0
        count = 1
        ansFlag = false
    }

    @IBAction func minus() {
        ope = 2
        point = 0
        count = 1
        ansFlag = false
    }

    @IBAction func multi() {
        ope = 3
        point = 0
        count = 1
        ansFlag = false
    }
    
    @IBAction func divison() {
        ope = 4
        point = 0
        count = 1
        ansFlag = false
    }

    @IBAction func clear() {
        input1 = 0
        input2 = 0
        syousu1 = 0
        syousu2 = 0
        ope = 0
        point = 0
        count = 1
        ansFlag = false
        numLabel.text = String(format:"%g", input1)
    }
    
    @IBAction func percent() {
        if ope == 0 {
            input1 = input1 / 100
            numLabel.text = String(format:"%g", input1)
        } else {
            input2 = input2 / 100
            numLabel.text = String(format:"%g", input1)
        }
    }
    
    @IBAction func changeMinus() {
        if ope == 0 {
            input1 = input1 * (-1)
            numLabel.text = String(format:"%g", input1)
        } else {
            input2 = input2 * (-1)
            numLabel.text = String(format:"%g", input2)
        }
    }
    
    @IBAction func decimalPoint() {
        if ansFlag {
            input1 = 0
            syousu1 = 0
            numLabel.text = String(format:"%g", input1)
        }
        
        point = 1
    }
    
    @IBAction func equal() {
        var ans: Float!
        switch ope {
            case 1:
                ans = (Float(input1) + syousu1) + (Float(input2) + syousu2)
                break
            case 2:
                ans = (Float(input1) + syousu1) - (Float(input2) + syousu2)
                break
            case 3:
                ans = (Float(input1) + syousu1) * (Float(input2) + syousu2)
                break
            case 4:
                ans = (Float(input1) + syousu1) / (Float(input2) + syousu2)
                break
            default:
                break
        }
        numLabel.text = String(format:"%g", ans)
        
        input1 = ans
        input2 = 0
        syousu1 = 0
        syousu2 = 0
        ope = 0
        point = 0
        count = 1
        
        ansFlag = true
    }

}

