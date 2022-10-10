//
//  ContentView.swift
//  LiveActivities&IslandDemo
//
//  Created by AlmoutasemBellah Abdallah on 09/10/2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello this is your train round trip app")
                .font(.title2)
                .padding()
            Image(systemName: "train.side.front.car")
                .resizable()
                .frame(width: 100,height: 50)
                .padding()
                .foregroundColor(.blue.opacity(0.5))
            Spacer()
            VStack{
                
                Button("Start Trip 🏁") {
                    startTrip()
                }
                .setButtonLook()
                
                
                Button("Update Trip 🚦") {
                    updateTrip()
                }
                .setButtonLook()
                
                
                
                Button("Stop Trip 🛑") {
                    stopTrips()
                }
                .setButtonLook()
                
                
                Button("Show ad 🎟") {
                    shoeTripAd()
                }
                .setButtonLook()
                
                Button("Stop ad 🎟") {
                    stopAd()
                }
                .setButtonLook()
                
            }
            Spacer()
            
            
        }
        .font(.callout)
    }
    
    //MARK: Functions
    
    func startTrip() {
        let liveTripAttributes = LiveTripDemoAttributes()
        let tripStatus = LiveTripDemoAttributes.TripStatus(value: 50)
        do{
            let tripActivity = try Activity<LiveTripDemoAttributes>.request(
                attributes: liveTripAttributes,
                contentState: tripStatus)
            print("Did request live trip activity \(tripActivity.id)")
        }catch(let error){
            print("Error requesting live activity \(error.localizedDescription)")
        }
    }
    
    
    func updateTrip() {
        Task{
            let tripStatus  = LiveTripDemoAttributes.TripStatus(value: 90)
           
            for activity in Activity<LiveTripDemoAttributes>.activities {
                await activity.update(using: tripStatus)
            }
        }
    }
    
    func stopTrips() {
        Task{
            for activity in Activity<LiveTripDemoAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
    
    @MainActor
    func shoeTripAd() {
        let liveTripAttributes = TripAdDemoAttributes()
        let tripStatus = TripAdDemoAttributes.TripStatus(value: 50)
        do{
            let tripActivity = try Activity<TripAdDemoAttributes>.request(
                attributes: liveTripAttributes,
                contentState: tripStatus)
            print("Did request live trip activity \(tripActivity.id)")
        }catch(let error){
            print("Error requesting live activity \(error.localizedDescription)")
        }
    }
    
    func stopAd() {
        Task{
            for activity in Activity<TripAdDemoAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
