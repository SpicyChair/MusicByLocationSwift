//
//  ContentView.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var locationHandler = LocationHandler()
    
    var body: some View {
        
        Form {
            Section {
                Text("\(locationHandler.locality), \(locationHandler.country)")
                    .bold()
                Text("\(locationHandler.latitude), \(locationHandler.longitude)")
                Text("Timezone: \(locationHandler.timezone)")
            }
            Section {
                Button("Find Music") {
                    locationHandler.requestLocation()
                }
            }
        }
        .onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
