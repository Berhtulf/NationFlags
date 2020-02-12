//
//  DoubleExtension.swift
//  NationFlags
//
//  Created by Martin Václavík on 09/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3 //maximum digits in Double after dot (maximum precision)
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3
        return String(formatter.string(from: number) ?? "")
    }
}

