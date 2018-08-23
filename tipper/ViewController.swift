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
    
    let defaults = UserDefaults.standard
    // default tip percentages
    var tipPercentages = [18.0, 20.0, 25.0]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if defaults.double(forKey: "firstTip") != 0.0 {
            tipPercentages[0] = defaults.double(forKey: "firstTip")
        }

        if defaults.double(forKey: "secondTip") != 0.0 {
            tipPercentages[1] = defaults.double(forKey: "secondTip")
        }
        
        if defaults.double(forKey: "thirdTip") != 0.0 {
            tipPercentages[2] = defaults.double(forKey: "thirdTip")
        }
        
        for i in tipPercentages.indices {
            let tip = Int(tipPercentages[i])
            tipControl.setTitle("\(tip)%", forSegmentAt: i)
        }
        
        // recalculate tip if the selected segment control has been updated
        updateLabels()
    }
    
    func updateLabels() {
        if let bill = Double(billLabel.text!) {
            let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex] / 100)
            let total = bill + tip
            tipLabel.text = String(format: "$%.02f", tip)
            totalLabel.text = String(format: "$%.02f", total)
        } else {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        updateLabels()
    }
}

