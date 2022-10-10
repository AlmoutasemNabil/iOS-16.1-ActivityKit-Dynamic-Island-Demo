//
//  LiveTripDemoLiveActivity.swift
//  LiveTripDemo
//
//  Created by AlmoutasemBellah Abdallah on 10/10/2022.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveTripDemoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveTripDemoAttributes.self) { context in
            // Lock screen/banner UI goes here
            TrainTripView(trinDistance: context.state.value)
            
        } dynamicIsland: { context in
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
                    ProgressView("Paddington Station", value: context.state.value, total: 100)
                        .padding()
                        .foregroundColor(.red)
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
