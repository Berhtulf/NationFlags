//
//  ProgressBar.swift
//  Countries
//
//  Created by Martin Václavík on 15/10/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value:Int
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(height: 10)
                    .opacity(0.1)
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(self.value > 15 ? Color.green : Color.red)
                        .frame(width: CGFloat(geometryReader.size.width / 60 * CGFloat(self.value)), height: 10)
                        .animation(.linear(duration: 1))
                }
                Text("\(self.value)")
            }
        }.frame(height: 40)
    }
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ProgressBar(value: .constant(60)).padding().previewDevice(PreviewDevice(rawValue: "iPhone 7"))
            ProgressBar(value: .constant(10)).padding().previewDevice(PreviewDevice(rawValue: "iPhone X"))
            ProgressBar(value: .constant(1)).padding().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            ProgressBar(value: .constant(60)).padding().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
