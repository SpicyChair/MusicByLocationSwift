//
//  StateController.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 02/03/2022.
//

import Foundation

class StateController: ObservableObject {
    
    @Published var lastKnownLocation:String = ""
    @Published var locality:String = "Null Island"
    @Published var country:String = "Nowhere"
    @Published var latitude:Double = 0
    @Published var longitude:Double = 0
    @Published var timezone: String = "UTC+0"
    
    @Published var artistNames:[String] = []
    
    private let locationHandler:LocationHandler = LocationHandler()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func getArtists(searchFor: String) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchFor)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: urlString)
        else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map{
                        return $0.name
                    }
                    DispatchQueue.main.async{
                        self.artistNames = names
                    }
                            
                }
            }
        }.resume()
            
    }
            
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        do {
            let artistResponse = try decoder.decode(ArtistResponse.self, from: json)
            return artistResponse
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return nil
        /*
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Error decoding JSON")
            return nil
        }
         */
    }
    
}
