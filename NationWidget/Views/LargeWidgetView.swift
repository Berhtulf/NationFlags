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
        GeometryReader{ geometry in
            VStack{
                MediumWidgetView(entry: entry)
                    .frame(height: geometry.size.height/3)
                Spacer()
                VStack{
                    if let image = entry.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }else{
                        ZStack{
                            Color.secondary.opacity(0.3)
                            Image(systemName: "rectangle.slash")
                                .font(.system(size: 50))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .shadow(color: Color("DarkWhite"), radius: 4)
                .frame(height: geometry.size.height/1.5)
            }
        }
    }
}
