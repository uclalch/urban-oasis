//
//  HotelListView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI

struct HotelListView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = HotelViewModel() // Using HotelViewModel to manage hotel data

    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                TextField("Search hotels...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top)

                // Hotel list filtered by search text
                List {
                    ForEach(viewModel.hotels.filter {
                        searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                    }, id: \.id) { hotel in
                        NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                            HotelCardView(hotel: hotel) // Use your existing HotelCardView
                        }
                    }
                }
            }
            .navigationTitle("Urban Oasis Hotels")
            .toolbar {
                // Profile Button
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    }
                }
                // Map Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HotelMapView(hotels: viewModel.hotels)) { // Pass the hotel list to the map view
                        Image(systemName: "map")
                            .imageScale(.large)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true) // Remove back button on login page after navigating to Main Page
    }
}


struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}
