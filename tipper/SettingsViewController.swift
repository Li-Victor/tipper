//
//  SettingsViewController.swift
//  tipper
//
//  Created by Victor Li on 8/15/18.
//  Copyright © 2018 Victor Li. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstTipSlider: UISlider!
    @IBOutlet weak var secondTipSlider: UISlider!
    @IBOutlet weak var thirdTipSlider: UISlider!
    
    @IBOutlet weak var firstTipLabel: UILabel!
    @IBOutlet weak var secondTipLabel: UILabel!
    @IBOutlet weak var thirdTipLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    func setText(of label: UILabel, to text: String) {
        label.text = text
    }
    
    func setValue(of slider: UISlider, to number: Int) {
        slider.setValue(Float(number), animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if defaults.double(forKey: "firstTip") != 0.0 {
            let tip = Int(defaults.double(forKey: "firstTip"))
            setText(of: firstTipLabel, to: "\(tip)%")
            setValue(of: firstTipSlider, to: tip)
        } else {
            // default value
            setText(of: firstTipLabel, to: "18%")
            setValue(of: firstTipSlider, to: 18)
        }
        
        if defaults.double(forKey: "secondTip") != 0.0 {
            let tip = Int(defaults.double(forKey: "secondTip"))
            setText(of: secondTipLabel, to: "\(tip)%")
            setValue(of: secondTipSlider, to: tip)
        } else {
            // default value
            setText(of: secondTipLabel, to: "20%")
            setValue(of: secondTipSlider, to: 20)
        }
        
        if defaults.double(forKey: "thirdTip") != 0.0 {
            let tip = Int(defaults.double(forKey: "thirdTip"))
            setText(of: thirdTipLabel, to: "\(tip)%")
            setValue(of: thirdTipSlider, to: tip)
        } else {
            // default value
            setText(of: thirdTipLabel, to: "25%")
            setValue(of: thirdTipSlider, to: 25)
        }
    }
    
    @IBAction func firstSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        firstTipLabel.text = "\(value)%"
        defaults.set(Double(value), forKey: "firstTip")
        defaults.synchronize()
    }
    
    @IBAction func secondSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        secondTipLabel.text = "\(value)%"
        defaults.set(Double(value), forKey: "secondTip")
        defaults.synchronize()
    }
    
    @IBAction func thirdSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        thirdTipLabel.text = "\(value)%"
        defaults.set(Double(value), forKey: "thirdTip")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
