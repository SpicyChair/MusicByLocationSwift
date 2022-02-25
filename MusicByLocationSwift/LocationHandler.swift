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
    
    @Published var locality:String = "Null Island"
    @Published var country:String = "Nowhere"
    @Published var latitude:Double = 0
    @Published var longitude:Double = 0
    @Published var timezone: String = "UTC+0"
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
                    self.locality = "Could not perform lookup of location"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.locality = firstPlacemark.locality ?? "Couldn't find locality"
                        self.country = firstPlacemark.country ?? "Couldn't find country"
                        self.timezone = firstPlacemark.timeZone?.abbreviation() ?? "Couldn't find timezone"
                    }
                }
                
            })
        }
        
        
        //find coordinates
        if let coordinates = locations.first?.coordinate {
            self.latitude = coordinates.latitude
            self.longitude = coordinates.longitude
        }
         
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        print("TODO")
        locality = "Error finding location"
    }
    
    
    
    
}
