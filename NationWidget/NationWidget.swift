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
        StaticConfiguration(kind: kind,
                            provider: Provider()) { entry in
            NationWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(LocalizedStringKey("Countries"))
        .description(LocalizedStringKey("WidgetDescription"))
    }
}

struct Provider: TimelineProvider {
    @AppStorage("nations", store: UserDefaults(suiteName: "group.com.vaclavikmartin.nationFlags"))
    var nationsData: Data = Data()
    
    func getSnapshot(in context: Context, completion: @escaping (NationEntry) -> Void) {
        guard let nation = try? JSONDecoder().decode([Nation].self, from: nationsData) else { return }
        let item = nation.randomElement()!
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.region = MKCoordinateRegion(center: item.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: item.locationZoom + 10, longitudeDelta: item.locationZoom + 10))
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width: UIScreen.main.bounds.height * 0.8 , height: UIScreen.main.bounds.height / 4)
        
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
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        guard let nation = try? JSONDecoder().decode([Nation].self, from: nationsData) else { return }
        let item = nation.randomElement()!
        let date = Date()
        //        let entry = NationEntry(nation: nation.randomElement()!)
        let nextUpdateDate = Calendar.current.date(byAdding: .second, value: 1, to: date)!
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.region = MKCoordinateRegion(center: item.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: item.locationZoom + 10, longitudeDelta: item.locationZoom + 10))
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
