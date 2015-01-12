//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Bubu on 12/4/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

import UIKit

class TipCalculatorModel: NSObject {
    var total: Double //Total despues de impuestos
    var taxPct: Double //Porcentaje de impuesto sobre el subtotal
    var subtotal: Double //Subtotal de la cuenta
        {
        get {
            return total / (taxPct + 1)
        }
    }
    
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double) ] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        // 2
        var retval = Dictionary<Int, (tipAmt:Double, total:Double) >()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            
            println("Valor Intermedio \(intPct)")
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
}