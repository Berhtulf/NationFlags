//
//  NationEntry.swift
//  NationFlags
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import WidgetKit

struct NationEntry: TimelineEntry {
    let date: Date
    let nation: Nation
    
    var image:UIImage? = nil
}
