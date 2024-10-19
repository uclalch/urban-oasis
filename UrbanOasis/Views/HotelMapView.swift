//
//  HotelMapView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/12.
//

//  HotelMapView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/12.

import SwiftUI
import MapKit

struct HotelMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), // Los Angeles
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    @State private var selectedHotel: Hotel? = nil
    @State private var showDetail: Bool = false

    let hotels: [Hotel]

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: hotels) { hotel in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude)) {
                    Button(action: {
                        selectedHotel = hotel
                        showDetail = true
                    }) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.purple)
                                .shadow(radius: 5)
                            Text(hotel.name)
                                .font(.custom("Avenir Next", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.purple)
                                .padding(4)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(5)
                        }
                    }
                }
            }

            if let selectedHotel = selectedHotel, showDetail {
                NavigationLink(
                    destination: HotelDetailView(hotel: selectedHotel),
                    isActive: $showDetail,
                    label: { EmptyView() }
                )
            }
        }
        .navigationTitle("Hotel Locations")
    }
}

struct HotelMapView_Previews: PreviewProvider {
    static var previews: some View {
        HotelMapView(hotels: [
            Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99, latitude: 34.0259, longitude: -118.7798),
            Hotel(name: "Downtown City Hotel", description: "Modern amenities in the heart of downtown.", imageUrl: "hotel2", location: "New York, NY", pricePerNight: 299.99, latitude: 40.7128, longitude: -74.0060)
        ])
    }
}
