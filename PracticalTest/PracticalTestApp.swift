//
//  PracticalTestApp.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import SwiftUI

@main
struct PracticalTestApp: App {
    @StateObject private var vm = MoviesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoviesView()
                    .environmentObject(vm)
            }
            
        }
    }
}
