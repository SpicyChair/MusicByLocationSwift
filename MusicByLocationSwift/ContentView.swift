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
        VStack {
            Text(locationHandler.lastKnownLocation)
            Spacer()
            Button("Find Music") {
                locationHandler.requestAuthorisation()
                locationHandler.requestLocation()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
