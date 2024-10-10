//
//  Hotel.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import Foundation

struct Hotel: Identifiable {
    var id = UUID() // Unique identifier for each hotel.
    var name: String
    var description: String
    var imageUrl: String
    var location: String
    var pricePerNight: Double
}

