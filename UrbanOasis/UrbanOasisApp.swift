//
//  UrbanOasisApp.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/10.
//
// Tests

import SwiftUI
import Firebase

@main
struct UrbanOasisApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
