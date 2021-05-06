//
//  MapSelectView.swift
//  NationFlags
//
//  Created by Martin Václavík on 26/02/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import GameKit

struct MapSelectView: View {
    @EnvironmentObject var viewModel: GameModeViewModel
    @State var map = CGSize(width: 350, height: 0)
    
    public var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded {
                viewModel.handleMapDragGesture(location: $0.location, map: map)
        }
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            ModeSelectMapImage()
                .gesture(self.dragGesture)
                .onAppear(){
                    GKAccessPoint.shared.isActive = false
                    map = geometryReader.size
            }
        }.frame(minWidth: 300, idealWidth: map.width, maxWidth: 414, idealHeight: map.height, maxHeight: 225)
    }
}

struct MapSelectView_Previews: PreviewProvider {
    static var previews: some View {
        MapSelectView()
            .environmentObject(GameModeViewModel())
    }
}
