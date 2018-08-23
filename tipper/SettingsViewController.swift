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
    @IBOutlet weak var firstTipLabel: UILabel!
    @IBOutlet weak var secondTipSlider: UISlider!
    @IBOutlet weak var secondTipLabel: UILabel!
    @IBOutlet weak var thirdTipSlider: UISlider!
    @IBOutlet weak var thirdTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        firstTipLabel.text = "\(value)%"
    }
    
    @IBAction func secondSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        secondTipLabel.text = "\(value)%"
    }
    
    @IBAction func thirdSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        thirdTipLabel.text = "\(value)%"
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
