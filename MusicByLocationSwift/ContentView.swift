//
//  ContentView.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    let locationHandler = LocationHandler()
    
    var body: some View {
        VStack {
            Text("Hello World")
            Spacer()
            Button("Find Music") {
                
            }
        }.onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
