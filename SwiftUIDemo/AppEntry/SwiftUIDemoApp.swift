//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//
import SwiftUI
import FirebaseCore
import Firebase

@main
struct SwiftUIDemoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(SessionManager.shared)
        }
    }
}
