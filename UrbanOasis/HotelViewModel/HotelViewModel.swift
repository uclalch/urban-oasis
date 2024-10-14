//
//  HotelViewModel.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/12.
//

import Foundation
import Combine

class HotelViewModel: ObservableObject {
    @Published var hotels: [Hotel] = []

    init() {
        loadHotels()
    }

    func loadHotels() {
        // Placeholder for now, later this can fetch data from an API
        hotels = [
            Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99),
            Hotel(name: "Downtown City Hotel", description: "Modern amenities in the heart of downtown.", imageUrl: "hotel2", location: "New York, NY", pricePerNight: 299.99),
            Hotel(name: "Coastal Escape Hotel", description: "Beautiful ocean escape with private beach.", imageUrl: "hotel3", location: "San Diego, CA", pricePerNight: 399.99),
            Hotel(name: "Mountain Retreat Lodge", description: "Scenic mountain views and hiking trails.", imageUrl: "hotel4", location: "Aspen, CO", pricePerNight: 299.99),
            Hotel(name: "Urban Chic Hotel", description: "Modern hotel in the heart of the city.", imageUrl: "hotel5", location: "Chicago, IL", pricePerNight: 349.99),
        ]
    }
}
