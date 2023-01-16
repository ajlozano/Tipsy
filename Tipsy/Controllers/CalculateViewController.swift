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
    var calculationBrain = CalculationBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        //billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        TenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        calculationBrain.SetPct(pct: sender.currentTitle ?? "10%")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        calculationBrain.SetSplit(split: splitNumberLabel.text ?? "2")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculationBrain.SetBill(bill: billTextField.text)
        calculationBrain.calculateTip()
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalSplit = calculationBrain.GetTotalSplit()
            destinationVC.splitNumber = calculationBrain.GetSplitNumber()
            destinationVC.pctValue = calculationBrain.GetPct()
        }
    }
}

