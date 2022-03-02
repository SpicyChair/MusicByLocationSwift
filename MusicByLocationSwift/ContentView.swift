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
                Text(state.artistNames.joined(separator: ", "))
                List {
                    ForEach (0..<state.artistNames.count) {index in
                        Text(state.artistNames[index])
                    }
                }
            }
            Section {
                Button("Find Music") {
                    state.findMusic()
                    state.getArtists()
                    
                }
            }
        }
        .onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
