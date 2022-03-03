//
//  ContentView.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var state = StateController()
    
    var body: some View {
        
        Form {
            Section {
                Text("\(state.locality), \(state.country)")
                    .bold()
                Text("\(state.latitude), \(state.longitude)")
                Text("Timezone: \(state.timezone)")
                 
            }
            Section {
                Text("Results")
                    .bold()
                List {
                    ForEach(state.artists, id: \.self) { artist in
                        Link("\(artist.name), \(artist.genre)", destination: URL(string: artist.link)!)
                    }
                }
            }
                     
            Section {
                Button("Find Music") {
                    state.getUserLocation()
                }
            }
        }
        .onAppear(perform: {
            
            state.requestAccessToLocationData()
            state.getUserLocation()
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
