//
//  LiveTripDemoAttributes.swift
//  LiveActivities&IslandDemo
//
//  Created by AlmoutasemBellah Abdallah on 10/10/2022.
//

import ActivityKit

struct LiveTripDemoAttributes: ActivityAttributes {
    public typealias TripStatus = ContentState

    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Float
    }
}


struct TripAdDemoAttributes: ActivityAttributes {
    public typealias TripStatus = ContentState

    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Float
    }
}
