//
//  ModeSelectMapImage.swift
//  Countries
//
//  Created by Martin Václavík on 06/01/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI

struct ModeSelectMapImage: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        VStack{
            if settings.img == [0,0,0,0,0] {
                Image("00000")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,0,0,1] {
                Image("00001")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,0,1,0] {
                Image("00010")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,0,1,1] {
                Image("00011")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,1,0,0] {
                Image("00100")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,1,0,1] {
                Image("00101")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,1,1,0] {
                Image("00110")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,0,1,1,1] {
                Image("00111")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,0,0,0] {
                Image("01000")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,0,0,1] {
                Image("01001")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,0,1,0] {
                Image("01010")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,0,1,1] {
                Image("01011")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,1,0,0] {
                Image("01100")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,1,0,1] {
                Image("01101")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,1,1,0] {
                Image("01110")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [0,1,1,1,1] {
                Image("01111")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,0,0,0] {
                Image("10000")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,0,0,1] {
                Image("10001")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,0,1,0] {
                Image("10010")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,0,1,1] {
                Image("10011")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,1,0,0] {
                Image("10100")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,1,0,1] {
                Image("10101")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,1,1,0] {
                Image("10110")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,0,1,1,1] {
                Image("10111")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,0,0,0] {
                Image("11000")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,0,0,1] {
                Image("11001")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,0,1,0] {
                Image("11010")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,0,1,1] {
                Image("11011")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,1,0,0] {
                Image("11100")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,1,0,1] {
                Image("11101")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,1,1,0] {
                Image("11110")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }else if settings.img == [1,1,1,1,1] {
                Image("11111")
                    .resizable()
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
            }
        }
    }
}
struct ModeSelectMapImage_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModeSelectMapImage().environmentObject(UserSettings())
                .environment(\.locale, Locale(identifier: "cs"))
        }
    }
}
