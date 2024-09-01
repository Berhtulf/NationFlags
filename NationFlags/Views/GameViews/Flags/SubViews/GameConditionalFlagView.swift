//
//  GameConditionalFlagView.swift
//  NationFlags
//
//  Created by Martin Václavík on 06.05.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI

struct GameConditionalFlagView: View {
    var item: Nation
    var isCorrect: Bool
    var showCorrect: Bool?
    var wasTapped: Bool

    var body: some View {
        if isCorrect && showCorrect == true {
            ShowCorrectFlag(nation: item)
        } else {
            if isCorrect && wasTapped {
                GameCorrectFlag(image: item.image)
            } else if wasTapped {
                GameWrongFlag(image: item.image)
            } else {
                GameFlagImage(image: item.image)
            }
        }
    }
}
