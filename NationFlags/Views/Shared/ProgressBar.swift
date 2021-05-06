//
//  ProgressBar.swift
//  Countries
//
//  Created by Martin Václavík on 15/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @ObservedObject var timer = TimerManager.shared
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.gray)
                        .frame(height: 10)
                        .opacity(0.1)
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(timer.time > 15 ? Color.green : Color.red)
                        .frame(width: CGFloat(geometryReader.size.width / 60 * CGFloat(timer.time)), height: 10)
                }
                Text("\(timer.time)")
            }
        }.frame(height: 40)
    }
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ProgressBar().padding().previewDevice(PreviewDevice(rawValue: "iPhone 7"))
            ProgressBar().padding().previewDevice(PreviewDevice(rawValue: "iPhone X"))
            ProgressBar().padding().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            ProgressBar().padding().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
