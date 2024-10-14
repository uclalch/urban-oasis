//
//  Hotel.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import Foundation

struct Hotel: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var location: String
    var pricePerNight: Double
//    var latitude: Double
//    var longitude: Double
}

