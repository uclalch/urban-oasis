//
//  ContentView.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Urban Oasis")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
