//
//  LargeWidgetView.swift
//  NationWidgetExtension
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct LargeWidgetView: View {
    let entry: NationEntry
    
    var body: some View {
        VStack{
            MediumWidgetView(entry: entry)
            if let image = entry.image {
                Image(uiImage: image)
                    .shadow(radius: 4)
            }
        }
    }
}
