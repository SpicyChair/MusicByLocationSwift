//
//  LocationHandler.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 25/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler : NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        requestAuthorisation()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        print("TODO")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        print("TODO")
    }
    
    
}
