//
//  OurCustomersViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation
import CoreLocation

extension OurCustomersViewModel {
    struct State {
        var myLocation: CLLocation?

        func getDistance(for customer: Customer) -> String {
            if let myLocation {
                let customerLocation = CLLocation(latitude: customer.latitude,
                                                  longitude: customer.longitude)
                let locationString = String(format: "%.2f", myLocation.distance(from: customerLocation) / 1000)
                return "\(locationString) Km from you"
            } else {
                return "No location available"
            }
        }
    }
    
    enum Intent { }
}

final class OurCustomersViewModel: NSObject, ViewModel, CLLocationManagerDelegate {
    @Published private(set) var state: State

    // Location manager
    private let manager = CLLocationManager()

    override init() {
        self.state = State(myLocation: nil)
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func intent(_ intent: Intent) { }

    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        state.myLocation = location
    }
}
