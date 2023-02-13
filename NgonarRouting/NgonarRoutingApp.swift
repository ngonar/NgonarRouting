//
//  NgonarRoutingApp.swift
//  NgonarRouting
//
//  Created by Iwan Saputra on 14/02/23.
//

import SwiftUI

@main
struct NgonarRoutingApp: App {
    
    @StateObject private var apiFetcher = APIFetcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(apiFetcher)
        }
    }
}
