//
//  TUeatsApp.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/22/22.
//

import SwiftUI
import Firebase

@main
struct TUeatsApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}


