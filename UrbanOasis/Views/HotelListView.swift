//
//  HotelListView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI

struct HotelListView: View {
    @StateObject private var viewModel = HotelViewModel()

    var body: some View {
        NavigationView {
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
            .navigationTitle("Urban Oasis Hotels")
        }
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}

