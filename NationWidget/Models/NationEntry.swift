//
//  NationEntry.swift
//  NationFlags
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import UIKit
import WidgetKit

struct NationEntry: TimelineEntry, Hashable {
    var date: Date
    let nation: Nation
    
    var image: UIImage?
}
