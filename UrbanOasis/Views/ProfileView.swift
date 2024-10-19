//
//  ProfileView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/15.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @State private var user: User?
    @State private var errorMessage = ""
    @State private var showProfileCreation = false
    @State private var navigateToHotelList = false

    var body: some View {
        VStack {
//            if let user = user {
//                Button(action: {
//                    navigateToHotelList = true
//                }) {
//                    Text("Go to Hotel List")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                }
//            }
//            NavigationLink(destination: HotelListView(), isActive: $navigateToHotelList) {
//                EmptyView()
//            }
            NavigationView {
                VStack {
                    if let user = user {
                        Text("Welcome, \(user.username)")
                            .font(.largeTitle)
                            .padding()
                        
                        if user.userType == .customer {
                            Text("Your Favorites")
                                .font(.headline)
                                .padding(.top)
                            Text("(No favorites added yet)")
                                .foregroundColor(.gray)
                                .padding(.top, 5)
                        } else if user.userType == .hotel {
                            Text("Manage Your Listings")
                                .font(.headline)
                                .padding(.top)
                            Button(action: {
                                // Action to add a new listing
                            }) {
                                Text("Add New Listing")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    } else if showProfileCreation {
                        // Profile creation form
                        VStack {
                            Text("Create Your Profile")
                                .font(.largeTitle)
                                .padding()
                            
                            TextField("Username", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Picker("Account Type", selection: $userType) {
                                Text("Customer").tag(UserType.customer)
                                Text("Hotel").tag(UserType.hotel)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal)
                            
                            Button(action: saveUserProfile) {
                                Text("Save Profile")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    } else {
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        } else {
                            Text("Loading user information...")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                }
                .navigationTitle("Profile")
                .background(
                    NavigationLink(destination: HotelListView(), isActive: $navigateToHotelList) {
                        EmptyView()
                    }
                )
                .onAppear(perform: loadUserData)
            }
        }
    }

    @State private var username = ""
    @State private var userType: UserType = .customer

    private func loadUserData() {
        guard let currentUser = Auth.auth().currentUser else {
            errorMessage = "User not logged in."
            return
        }

        let db = Firestore.firestore()
        db.collection("users").document(currentUser.uid).getDocument { document, error in
            if let error = error {
                errorMessage = "Failed to load user data: \(error.localizedDescription)"
            } else if let document = document, document.exists {
                let data = document.data()
                let username = data?["username"] as? String ?? ""
                let email = data?["email"] as? String ?? ""
                let userTypeString = data?["userType"] as? String ?? "customer"
                let userType: UserType = userTypeString == "customer" ? .customer : .hotel

                user = User(id: UUID(uuidString: currentUser.uid) ?? UUID(), username: username, email: email, userType: userType)
            } else {
                // No document exists, prompt to create profile
                showProfileCreation = true
            }
        }
    }

    private func saveUserProfile() {
        guard let currentUser = Auth.auth().currentUser else {
            errorMessage = "User not logged in."
            return
        }

        let db = Firestore.firestore()
        let newUser = User(id: UUID(uuidString: currentUser.uid) ?? UUID(), username: username, email: currentUser.email ?? "", userType: userType)

        db.collection("users").document(currentUser.uid).setData([
            "username": newUser.username,
            "email": newUser.email,
            "userType": newUser.userType == .customer ? "customer" : "hotel"
        ]) { error in
            if let error = error {
                errorMessage = "Failed to save user profile: \(error.localizedDescription)"
            } else {
                user = newUser
                showProfileCreation = false
                navigateToHotelList = true // After profile creation, navigate to hotel list view
            }
        }
    }
        
}

// Without Go to Hotel List View Button!! 10/17/2024 14:08

//
//import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//
//struct ProfileView: View {
//    @State private var user: User?
//    @State private var errorMessage = ""
//    @State private var showProfileCreation = false
//
//    var body: some View {
//        VStack {
//            if let user = user {
//                Text("Welcome, \(user.username)")
//                    .font(.largeTitle)
//                    .padding()
//
//                if user.userType == .customer {
//                    Text("Your Favorites")
//                        .font(.headline)
//                        .padding(.top)
//                    Text("(No favorites added yet)")
//                        .foregroundColor(.gray)
//                        .padding(.top, 5)
//                } else if user.userType == .hotel {
//                    Text("Manage Your Listings")
//                        .font(.headline)
//                        .padding(.top)
//                    Button(action: {
//                        // Action to add a new listing
//                    }) {
//                        Text("Add New Listing")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                            .padding(.horizontal)
//                    }
//                }
//            } else if showProfileCreation {
//                // Profile creation form
//                VStack {
//                    Text("Create Your Profile")
//                        .font(.largeTitle)
//                        .padding()
//
//                    TextField("Username", text: $username)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal)
//
//                    Picker("Account Type", selection: $userType) {
//                        Text("Customer").tag(UserType.customer)
//                        Text("Hotel").tag(UserType.hotel)
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .padding(.horizontal)
//
//                    Button(action: saveUserProfile) {
//                        Text("Save Profile")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.green)
//                            .cornerRadius(10)
//                            .padding(.horizontal)
//                    }
//                }
//            } else {
//                if !errorMessage.isEmpty {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .padding()
//                } else {
//                    Text("Loading user information...")
//                        .foregroundColor(.gray)
//                        .padding()
//                }
//            }
//        }
//        .navigationTitle("Profile")
//        .onAppear(perform: loadUserData)
//    }
//
//    @State private var username = ""
//    @State private var userType: UserType = .customer
//
//    private func loadUserData() {
//        guard let currentUser = Auth.auth().currentUser else {
//            errorMessage = "User not logged in."
//            return
//        }
//
//        let db = Firestore.firestore()
//        db.collection("users").document(currentUser.uid).getDocument { document, error in
//            if let error = error {
//                errorMessage = "Failed to load user data: \(error.localizedDescription)"
//            } else if let document = document, document.exists {
//                let data = document.data()
//                let username = data?["username"] as? String ?? ""
//                let email = data?["email"] as? String ?? ""
//                let userTypeString = data?["userType"] as? String ?? "customer"
//                let userType: UserType = userTypeString == "customer" ? .customer : .hotel
//
//                user = User(id: UUID(uuidString: currentUser.uid) ?? UUID(), username: username, email: email, userType: userType)
//            } else {
//                // No document exists, prompt to create profile
//                showProfileCreation = true
//            }
//        }
//    }
//
//    private func saveUserProfile() {
//        guard let currentUser = Auth.auth().currentUser else {
//            errorMessage = "User not logged in."
//            return
//        }
//
//        let db = Firestore.firestore()
//        let newUser = User(id: UUID(uuidString: currentUser.uid) ?? UUID(), username: username, email: currentUser.email ?? "", userType: userType)
//
//        db.collection("users").document(currentUser.uid).setData([
//            "username": newUser.username,
//            "email": newUser.email,
//            "userType": newUser.userType == .customer ? "customer" : "hotel"
//        ]) { error in
//            if let error = error {
//                errorMessage = "Failed to save user profile: \(error.localizedDescription)"
//            } else {
//                user = newUser
//                showProfileCreation = false
//            }
//        }
//    }
//}
