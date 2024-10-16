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
                    .background(Color.blue)
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
                print("Error details: \(error.localizedDescription)")
                errorMessage = error.localizedDescription
            } else {
                // Save additional user data to Firestore
                let userId = result?.user.uid ?? ""
                let user = User(id: UUID(uuidString: userId) ?? UUID(), username: username, email: email, userType: userType)
                saveUserToFirestore(user)
            }
        }
    }

    private func saveUserToFirestore(_ user: User) {
        let db = Firestore.firestore()
        db.collection("users").document(user.id.uuidString).setData([
            "username": user.username,
            "email": user.email,
            "userType": user.userType == .customer ? "customer" : "hotel"
        ]) { error in
            if let error = error {
                errorMessage = "Failed to save user: \(error.localizedDescription)"
                print("Firestore write error: \(error.localizedDescription)")
            } else {
                print("User saved successfully!")
            }
        }
    }
}
