//
//  MapView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/12.
//

import SwiftUI
import MapKit

//struct MapView: View {
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), // Los Angeles
//        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//    )
//    
//    let hotels: [Hotel]
//
//    var body: some View {
//        Map(coordinateRegion: $region, annotationItems: hotels) { hotel in
//            MapMarker(coordinate: CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude), tint: .blue)
//        }
//        .navigationTitle("Hotel Locations")
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(hotels: [
//            Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99, latitude: 34.0259, longitude: -118.7798),
//            Hotel(name: "Downtown City Hotel", description: "Modern amenities in the heart of downtown.", imageUrl: "hotel2", location: "New York, NY", pricePerNight: 299.99, latitude: 40.7128, longitude: -74.0060)
//        ])
//    }
//}

