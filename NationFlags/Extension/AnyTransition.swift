//
//  AnyTransition.swift
//  NationFlags
//
//  Created by Martin Václavík on 26/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.opacity
            .animation(Animation.default.delay(0.2))
        let removal = AnyTransition.opacity
            .animation(Animation.default.speed(2))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
