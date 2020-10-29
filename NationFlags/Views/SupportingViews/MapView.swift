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
    var type:Int = 0
    
    var mapType:MKMapType {
        if type == 1 {return .hybrid}
        if type == 2 {return .satellite}
        return .standard
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        let span = MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
        let region = MKCoordinateRegion(center: coord, span: span)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType
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
