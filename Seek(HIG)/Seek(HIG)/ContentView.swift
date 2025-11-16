//
//  ContentView.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                Tab("Home", systemImage: "house"){
                    HomeView()
                }
                Tab("Findings", systemImage: "binoculars") {
                    
                }
                Tab("Camera", systemImage: "camera") {
                    CameraView()
                }
                Tab("Goals", systemImage: "shield") {
                    
                }
                Tab("Challenges", systemImage: "checkmark") {
                }
            }
            .tint(.green)
        }
    }
}
#Preview {
    ContentView()
}
