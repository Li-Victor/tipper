//
//  ViewController.swift
//  tipper
//
//  Created by Victor Li on 8/13/18.
//  Copyright © 2018 Victor Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        if let bill = Double(billLabel.text!) {
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            tipLabel.text = String(format: "$%.02f", tip)
            totalLabel.text = String(format: "$%.02f", total)
        } else {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
        
    }
}

