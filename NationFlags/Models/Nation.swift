/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Nation: Hashable, Codable, Identifiable {
    static var list: [Nation] = load("Nations.json")
    private var latlngZm: [Double]

    let id = UUID()
    var name: String
    var capital: String
    var region: String
    var population: Int
    var area: Double
    var alpha2Code: String
    var recognition: String
    
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
    var locationZoom: CLLocationDegrees {
        CLLocationDegrees(latlngZm[2])
    }
    
    static let czechRepublic = Nation(
        latlngZm: [49.75, 15.5, 10],
        name: "Czech Republic",
        capital: "Prague",
        region: "Europe",
        population: 10558524,
        area: 78865,
        alpha2Code: "CZ",
        recognition: "All"
    )
    static let nepal = Nation(
        latlngZm: [49.75, 15.5, 10],
        name: "Nepal",
        capital: "Prague",
        region: "Europe",
        population: 10558524,
        area: 78865,
        alpha2Code: "NP",
        recognition: "All"
    )
}
