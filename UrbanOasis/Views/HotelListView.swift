//
//  HotelListView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI

struct HotelListView: View {
    @StateObject private var viewModel = HotelViewModel()
    @State private var showMapView = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showMapView.toggle()
                }) {
                    Text("View Hotels on Map")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showMapView) {
                    MapView(hotels: viewModel.hotels)
                        .presentationDetents([.fraction(0.8)]) // Set the sheet height to 80%
                        .presentationDragIndicator(.visible) // Show drag indicator to allow closing by dragging down
                }

                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(viewModel.hotels) { hotel in
                            NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                                HotelCardView(hotel: hotel)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.top, 20)
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

