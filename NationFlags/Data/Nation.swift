/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Nation: Hashable, Codable, Identifiable {
    private var latlngZm:[Double]
    
    let id = UUID()
    var name: String
    var capital: String
    var region: String
    var population: Int
    var area: Double
    var alpha2Code: String
    var notRecognizedBy: String
    
    var density: Int {
        let number = round(Double(population) / area)
        return Int(number)
    }

    var image: Image {
        let name = alpha2Code.lowercased()
        return Image(name)
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latlngZm[0],
            longitude: latlngZm[1])
    }
    var locationZoom:CLLocationDegrees{
        CLLocationDegrees(latlngZm[2])
    }
}


//struct Nation: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//    var city: String
//    var size: Double
//    var population: Int
//    var density: Int {
//        let number = round(Double(population) / size)
//        return Int(number)
//    }
//    var image: Image {
//        let name = imageName.lowercased()
//        return Image(name)
//    }
//    fileprivate var imageName: String
//    fileprivate var coordinates: Coordinates
//    var locationZoom:CLLocationDegrees{
//        CLLocationDegrees(coordinates.zoom)
//    }
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//}
//
//struct Coordinates: Hashable, Codable {
//    var zoom: CLLocationDegrees
//    var latitude: Double
//    var longitude: Double
//}
