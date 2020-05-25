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
            Image(settings.imgName)
                .resizable()
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fit)
                .padding(15)
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
