//
//  SwiftUIView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/15.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var userType: UserType = .customer
    @State private var errorMessage = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Picker("Account Type", selection: $userType) {
                Text("Customer").tag(UserType.customer)
                Text("Hotel").tag(UserType.hotel)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            Button(action: signUp) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Sign Up")
    }

    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                saveUserProfile()
                dismiss() // Go back to Welcome Page after sign-up
            }
        }
    }

    private func saveUserProfile() {
        guard let currentUser = Auth.auth().currentUser else {
            errorMessage = "User not logged in."
            return
        }

        let db = Firestore.firestore()
        let newUser = User(id: UUID(uuidString: currentUser.uid) ?? UUID(), username: username, email: email, userType: userType)

        db.collection("users").document(currentUser.uid).setData([
            "username": newUser.username,
            "email": newUser.email,
            "userType": newUser.userType == .customer ? "customer" : "hotel"
        ]) { error in
            if let error = error {
                errorMessage = "Failed to save user profile: \(error.localizedDescription)"
            }
        }
    }
}
