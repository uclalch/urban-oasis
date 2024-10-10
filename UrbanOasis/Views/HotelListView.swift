//
//  HotelListView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI

struct HotelListView: View {
    let hotels = [
        Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99),
        Hotel(name: "Downtown City Hotel", description: "Modern amenities in the heart of downtown.", imageUrl: "hotel2", location: "New York, NY", pricePerNight: 299.99)
    ]

    var body: some View {
        NavigationView {
            List(hotels) { hotel in
                NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                    HStack {
                        Image(hotel.imageUrl) // Placeholder image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                        VStack(alignment: .leading) {
                            Text(hotel.name)
                                .font(.headline)
                            Text(hotel.location)
                                .font(.subheadline)
                            Text("$\(hotel.pricePerNight, specifier: "%.2f") per night")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Urban Oasis Hotels")
        }
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}
