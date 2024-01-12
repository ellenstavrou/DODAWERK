//
//  DODAWERKApp.swift
//  DODAWERK
//
//  Created by Ellen Stavrou on 18/11/2023.
//
import FirebaseCore
import FirebaseAuth
import SwiftUI

@main
struct DODAWERKApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
            
        }
    }
}
