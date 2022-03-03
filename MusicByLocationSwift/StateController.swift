//
//  StateController.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 02/03/2022.
//

import Foundation

class StateController: ObservableObject {
    
    
    @Published var locality:String = ""  {
        didSet {
            adapter.getArtists(searchFor: country, completion: updateArtistsByLocation)
        }
    }
    @Published var country:String = ""
    @Published var latitude:Double = 0
    @Published var longitude:Double = 0
    @Published var timezone: String = "UTC+0"
    @Published var artists:[Artist] = []
    
    private let locationHandler:LocationHandler = LocationHandler()
    private let adapter = iTunesAdapter()
    
    func getUserLocation() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    private func updateArtistsByLocation(artists: [Artist]?) {
        let artists = artists?.map {
            return $0
        }
        DispatchQueue.main.async{
            self.artists = artists ?? []
        }
    }
    
            
    
}
