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
                Text(state.artistNames.isEmpty ? "Tap below to find music!" : state.artistNames[0...10].joined(separator: ", "))
            }
            Section {
                Button("Find Music") {
                    state.getArtists(searchFor: state.country)
                }
            }
        }
        .onAppear(perform: {
            
            state.requestAccessToLocationData()
            state.findMusic()
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
