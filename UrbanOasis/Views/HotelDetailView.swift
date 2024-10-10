//
//  HotelDetailView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI

struct HotelDetailView: View {
    let hotel: Hotel

    var body: some View {
        VStack {
            Image(hotel.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(15)
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text(hotel.name)
                    .font(.largeTitle)
                    .bold()

                Text(hotel.location)
                    .font(.title2)
                    .foregroundColor(.secondary)

                Text(hotel.description)
                    .font(.body)
                    .padding(.vertical)

                Text("Price per night: $\(hotel.pricePerNight, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundColor(.primary)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(hotel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(hotel: Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99))
    }
}

