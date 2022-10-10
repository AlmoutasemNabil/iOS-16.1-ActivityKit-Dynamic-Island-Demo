//
//  LiveTripDemo.swift
//  LiveTripDemo
//
//  Created by AlmoutasemBellah Abdallah on 10/10/2022.
//

import WidgetKit
import SwiftUI
import Intents

struct LiveTripDemo: Widget {
    let kind: String = "LiveTripDemo"

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TripAdDemoAttributes.self) { context in
            // Lock screen/banner UI goes here
            TrainTripView(trinDistance: context.state.value, shouldShowDistance: false)
        }  dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Bank")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Seven Kings")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Next: Paddington Station")
                    // more content
                }
            } compactLeading: {
                Text("BK")
            } compactTrailing: {
                Text("SK")
            } minimal: {
                Text("Paddington")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
