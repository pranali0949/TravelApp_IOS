//
//  makemyTripApp.swift
//  makemyTrip
//
//  Created by LAKMA on 2024-07-27.
//

import SwiftUI
import Firebase

@main
struct makemyTripApp: App {
    
       init() {
           FirebaseApp.configure()
       }
       
       var body: some Scene {
           WindowGroup {
               ContentView()
           }
       }
   }
