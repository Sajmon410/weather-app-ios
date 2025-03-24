//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Simon Radosavljević on 4.2.25..
//

import Foundation
import CoreLocation //GPS
import SwiftUICore

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager=CLLocationManager()
    
    @Published var location:CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate=self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
