//
//  NationWidget.swift
//  NationWidget
//
//  Created by Martin Václavík on 29/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import WidgetKit
import SwiftUI
import MapKit

@main
struct NationWidget: Widget {
    let kind: String = "NationWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            NationWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(LocalizedStringKey("Countries"))
        .description(LocalizedStringKey("WidgetDescription"))
    }
}

struct Provider: TimelineProvider {
    @AppStorage("nations", store: UserDefaults(suiteName: "group.com.vaclavikmartin.nationFlags"))
    var nationsData: Data = Data()
    
    //Preview ve Widget gallery
    func getSnapshot(in context: Context, completion: @escaping (NationEntry) -> (Void)) {
        let item = Nation.czechRepublic
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.region = MKCoordinateRegion(center: item.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: item.locationZoom  * 1.15, longitudeDelta: item.locationZoom * 1.15))
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height / 4 + 10)
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        
        var entry = NationEntry(
            date: Date(),
            nation: item
        )
        snapShotter.start { (snap, error) in
            let image = snap?.image
            entry.image = image
            
            print(entry)
            completion(entry)
        }
    }
    
    //Reálná data na obrazovce uživatele
    func getTimeline(in context: Context, completion: @escaping (Timeline<NationEntry>) -> Void) {
        guard let nation = try? JSONDecoder().decode([Nation].self, from: nationsData) else { return }
        let item = nation.randomElement()!
        let date = Date()
        //        let entry = NationEntry(nation: nation.randomElement()!)
        let nextUpdateDate = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.region = MKCoordinateRegion(center: item.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: item.locationZoom * 1.2, longitudeDelta: item.locationZoom * 1.1))
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height / 4 + 10)
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        
        var entry = NationEntry(
            date: date,
            nation: item
        )
        snapShotter.start { (snap, error) in
            let image = snap?.image
            entry.image = image
            
            print(entry)
            
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
            completion(timeline)
        }
    }
    
    func placeholder(in context: Context) -> NationEntry {
        let nation = try? JSONDecoder().decode([Nation].self, from: nationsData)
        return NationEntry(date: Date(), nation: nation!.first!)
    }
}
