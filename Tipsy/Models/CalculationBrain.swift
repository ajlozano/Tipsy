//
//  CalculationBrain.swift
//  Tipsy
//
//  Created by Toni Lozano Fernández on 16/1/23.
//

import UIKit

struct CalculationBrain {
    var calculation: Calculation?
    
    init() {
        calculation = Calculation(bill: 0.0, pct: 10, splitNumber: 2, totalSplitValue: 0.0)
    }
    
    mutating func calculateTip() {
        let bill = calculation?.bill ?? 0.0
        let billPlusPct = bill + (bill * (Float(calculation?.pct ?? 10)/100))
        let totalSplit = billPlusPct / Float(calculation?.splitNumber ?? 2)
        calculation?.totalSplitValue = totalSplit
    }
    
    mutating func SetBill(bill: String?) {
        calculation?.bill = Float(bill ?? "0.0")
    }
    
    mutating func SetPct(pct: String) {
        if (pct == "0%") {
            calculation?.pct = 0
        } else if (pct == "10%") {
            calculation?.pct = 10
        } else if (pct == "20%") {
            calculation?.pct = 20
        }
    }
    
    mutating func SetSplit(split: String) {
        calculation?.splitNumber = Int(split) ?? 2
    }
    
    func GetTotalSplit() -> Float { return calculation?.totalSplitValue ?? 0.0}
    func GetSplitNumber() -> Int { return calculation?.splitNumber ?? 2}
    func GetPct() -> Int { return calculation?.pct ?? 10}
}
