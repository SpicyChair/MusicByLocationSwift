//
//  LocationHandler.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 25/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler : NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    @Published var lastKnownLocation:String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        if let coordinates = locations.first?.coordinate {
            lastKnownLocation = "\(coordinates.latitude), \(coordinates.longitude)"
        } else {
            lastKnownLocation = "No valid location found"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        print("TODO")
        lastKnownLocation = "Error finding location"
    }
    
    
    
    
}
