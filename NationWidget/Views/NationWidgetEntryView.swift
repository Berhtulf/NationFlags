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
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemLarge:
            LargeWidgetView(entry: entry)
        case .systemMedium:
            MediumWidgetView(entry: entry)
        default:
            SmallWidgetView(entry: entry)
        }
    }
}

struct NationWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            NationWidgetEntryView(entry: NationEntry(date: Date(), nation: Nation.czechRepublic))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
