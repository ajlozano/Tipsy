//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Toni Lozano Fernández on 16/1/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var splitValue: Float = 0.0
    var splitNumber: Int = 0
    var pctValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(splitValue)"
        settingLabel.text = "Split between \(splitNumber) people, with \(pctValue)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }


}
