//
//  NationWidgetEntryView.swift
//  NationWidgetExtension
//
//  Created by Martin Václavík on 30/10/2020.
//  Copyright © 2020 Martin Václavík. All rights reserved.
//

import SwiftUI
import WidgetKit

struct NationWidgetEntryView: View {
    @Environment(\.widgetFamily) private var family: WidgetFamily
    var entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        VStack {
            switch family {
            case .systemLarge:
                LargeWidgetView(entry: entry)
            case .systemMedium:
                MediumWidgetView(entry: entry)
            default:
                SmallWidgetView(entry: entry)
            }
        }
        .widgetBackground(backgroundView: Color.clear)
    }
}

extension View {
    func widgetBackground(backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}

#Preview {
    Group {
        NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
