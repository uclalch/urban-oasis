//
//  LogInView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/15.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var navigateToMainPage = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: logIn) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            NavigationLink(destination: HotelListView(), isActive: $navigateToMainPage) {
                EmptyView()
            }
        }
        .navigationTitle("Log In")
    }

    private func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                navigateToMainPage = true // Navigate only if login is successful
                errorMessage = ""
            }
        }
    }
}
