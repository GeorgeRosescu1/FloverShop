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
        var location: CLLocation?

        func getDistance(for customer: Customer) -> String {
            if let location {
                let customerLocation = CLLocation(latitude: customer.latitude,
                                                  longitude: customer.longitude)
                let locationString = String(format: "%.2f", location.distance(from: customerLocation) / 1000)
                return "\(locationString) Km from you"
            } else {
                return "No location available"
            }
        }
    }
    
    enum Intent {
        case load
    }
}

final class OurCustomersViewModel: NSObject, ViewModel, CLLocationManagerDelegate {
    @Published private(set) var state: State

    private let manager = CLLocationManager()


    override init() {
        self.state = State(location: nil)
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        state.location = location
    }

    func intent(_ intent: Intent) {
        switch intent {
        case .load:
            print("a")
        }
    }
}
