//
//  MapView.swift
//  DemoApp
//
//  Created by Martin Václavík on 25/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coord: CLLocationCoordinate2D
    var zoom: CLLocationDegrees
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame:.zero)
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
        let region = MKCoordinateRegion(center: coord, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        MapView(coord: restNation[3].locationCoordinate,
                zoom:  restNation[3].locationZoom)
        }
    }
}
