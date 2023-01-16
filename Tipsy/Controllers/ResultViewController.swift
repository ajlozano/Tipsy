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
    
    var totalSplit: Float?
    var splitNumber: Int?
    var pctValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalSplit ?? 0.0)
        settingLabel.text = "Split between \(splitNumber ?? 2) people, with \(pctValue ?? 10)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }


}
