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
        .contentMarginsDisabled()
        .configurationDisplayName(LocalizedStringKey("Countries"))
        .description(LocalizedStringKey("WidgetDescription"))
    }
}

struct Provider: TimelineProvider {
    //Preview ve Widget gallery
    func getSnapshot(in context: Context, completion: @escaping (NationEntry) -> Void) {
        let item = Nation.czechRepublic
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.region = MKCoordinateRegion(center: item.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: item.locationZoom  * 1.15, longitudeDelta: item.locationZoom * 1.15))
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width: 400, height: 250)

        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)

        var entry = NationEntry(
            date: Date(),
            nation: item
        )
        snapShotter.start { snap, _ in
            let image = snap?.image
            entry.image = image

            completion(entry)
        }
    }

    //Reálná data na obrazovce uživatele
    func getTimeline(in context: Context, completion: @escaping (Timeline<NationEntry>) -> Void) {
        getSamples(count: 1, context: context) { samples in
            let date = Date()
            let nextUpdateDate = Calendar.current.date(byAdding: .day, value: 1, to: date)!

            let timeline = Timeline(entries: samples, policy: .after(nextUpdateDate))
            completion(timeline)
        }
    }

    func placeholder(in context: Context) -> NationEntry {
        return NationEntry(date: Date(), nation: Nation.czechRepublic)
    }

    func getSamples(count: Int, context: Context, completion: @escaping (_ samples: [NationEntry]) -> Void) {
        let nationSample = getNationSample(count: count)
        generateSamples(sampleList: nationSample, context: context) { retval in
            completion(retval)
        }

    }
    func generateSamples(sampleList: Set<Nation>, context: Context, completion: @escaping (([NationEntry]) -> Void)) {
        let currentDate = Date()
        var dayOffset = 0
        var retval: [NationEntry] = []
        for nation in sampleList {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            generateSample(nation: nation, context: context) { sample in
                var entry = sample
                entry.date = entryDate
                retval.append(entry)
                dayOffset += 1
                if dayOffset == sampleList.count {
                    completion(retval)
                }
            }
        }
    }

    func generateSample(nation: Nation, context: Context, completion: @escaping ((NationEntry) -> Void)) {
        var entry = NationEntry(date: Date(), nation: nation)
        if context.family == .systemLarge {
            let mapSnapshotOptions = MKMapSnapshotter.Options()
            mapSnapshotOptions.region = MKCoordinateRegion(center: nation.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: nation.locationZoom * 1.1, longitudeDelta: nation.locationZoom * 1.1))
            mapSnapshotOptions.size = CGSize(width: 400, height: 250)

            let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)

            snapShotter.start { snap, _ in
                let image = snap?.image
                entry.image = image
                completion(entry)
            }
        } else {
            completion(entry)
        }
    }

    private func getNationSample(count: Int) -> Set<Nation> {
        let list = Nation.list
        var nationSample: Set<Nation> = []
        while nationSample.count < count {
            guard let selectedNation = list.randomElement() else { return []}
            nationSample.insert(selectedNation)
        }
        return nationSample
    }
}
