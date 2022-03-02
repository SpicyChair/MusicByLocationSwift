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
    let geocoder = CLGeocoder()
    weak var stateController: StateController?
    
    
    //@Published var
    
    
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
        
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.stateController?.locality = "Could not perform lookup of location"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.stateController?.locality = firstPlacemark.locality ?? "Couldn't find locality"
                        self.stateController?.country = firstPlacemark.country ?? "Couldn't find country"
                        self.stateController?.timezone = firstPlacemark.timeZone?.abbreviation() ?? "Couldn't find timezone"
                    }
                }
                
            })
        }
        
        
        //find coordinates
        if let coordinates = locations.first?.coordinate {
            self.stateController?.latitude = coordinates.latitude
            self.stateController?.longitude = coordinates.longitude
        }
         
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        print("TODO")
        
    }
    
    
    
    
}
