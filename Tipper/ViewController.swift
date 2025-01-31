//
//  ViewController.swift
//  Tipper
//
//  Created by Ashley Auduong on 2/13/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        billAmountTextField.becomeFirstResponder()
        
        
    }
 
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //multiply tip*tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        //update total amount
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
}

