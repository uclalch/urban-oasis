//
//  HotelCardView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/12.
//

import SwiftUI

struct HotelCardView: View {
    var hotel: Hotel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, Color.blue.opacity(0.1)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Image(hotel.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(20, corners: [.topLeft, .topRight])

                VStack(alignment: .leading, spacing: 10) {
                    Text(hotel.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(hotel.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("$\(hotel.pricePerNight, specifier: "%.2f") per night")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .padding()
            }
        }
        .padding(.horizontal)
    }
}

struct HotelCardView_Previews: PreviewProvider {
    static var previews: some View {
        HotelCardView(hotel: Hotel(name: "Luxury Beach Resort", description: "5-star beach resort with ocean views.", imageUrl: "hotel1", location: "Malibu, CA", pricePerNight: 499.99, latitude: 34.0259, longitude: -118.7798))
            .frame(width: 350)
            .previewLayout(.sizeThatFits)
    }
}
