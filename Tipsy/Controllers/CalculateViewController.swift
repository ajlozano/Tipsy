//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var TenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitValueString: String = ""
    var pct: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        //billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        TenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        if (sender.currentTitle == "0%") {
            pct = 0
        } else if (sender.currentTitle == "10%") {
            pct = 10
        } else if (sender.currentTitle == "20%") {
            pct = 20
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        var totalSplitValue = Float(billTextField.text ?? "0.0") ?? 0.0
        let splitNumberValue = Float(splitNumberLabel.text!)
        
        totalSplitValue += (totalSplitValue * (Float(pct)/100))
        totalSplitValue /= Float(splitNumberValue ?? 2)
        
        splitValueString = String(format: "%.2f", totalSplitValue)
        print(totalSplitValue)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitValue = Float(splitValueString) ?? 0.0
            destinationVC.splitNumber = Int(splitNumberLabel.text!) ?? 2
            destinationVC.pctValue = pct
        }
    }
}

