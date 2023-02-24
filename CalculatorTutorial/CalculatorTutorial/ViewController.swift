//
//  ViewController.swift
//  CalculatorTutorial
//
//  Created by Lucas da Silva Claros on 23/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    @IBOutlet weak var workingsView: UIView!
    
    var workings:String = ""
    var result: Double = 0
    
    func updateWorkings() {
        calculatorWorkings.text = workings
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        clearAll()
        loadBorder()
        calculatorResults.text = ""
    }
    
    func loadBorder(){
        workingsView.addBorder(.bottom, color: UIColor.lightGray, width: 1)
    }
    
    func clearAll() {
        workings = ""
        calculatorResults.text = ""
        calculatorWorkings.text = ""
    }

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if (!workings.isEmpty) {
            workings.removeLast()
            updateWorkings()
        }
    }
    
    func addToWorkings(value: String) {
        if calculatorResults.text!.isEmpty{
            if (value.first!.isNumber) {
                workings += value
            } else {
                if !workings.last!.isNumber {
                    workings.removeLast()
                }
                workings += value
            }
        } else {
            if value.first!.isNumber {
                calculatorResults.text = ""
                workings = value
            }else {
                workings = calculatorResults.text! + value
                calculatorResults.text = ""
            }
        }
        updateWorkings()
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divisionTap(_ sender: Any) {
        addToWorkings(value: "÷")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorkings(value: "x")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        if (!workings.isEmpty) {
            prepareWorkingsForExpression()
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            
            calculatorResults.text = resultString
        }
    }
    
    func formatResult (result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.3f", result)
        }
    }
    
    func prepareWorkingsForExpression () {
        workings = workings.replacingOccurrences(of: "÷", with: "/")
        workings = workings.replacingOccurrences(of: "x", with: "*")
        if (!workings.last!.isNumber) {
            workings.removeLast()
        }
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

extension UIView {
    func addBorder (_ edge: UIRectEdge, color: UIColor, width: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        subview.heightAnchor.constraint(equalToConstant: width).isActive = true
        self.addSubview(subview)
        switch edge {
            case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            }else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
        subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        if edge == .left {
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        }else {
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        }

        default:
            break
        }
        
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
