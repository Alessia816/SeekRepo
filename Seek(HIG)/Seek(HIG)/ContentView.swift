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
                    FindingsView()
                }
                Tab("Camera", systemImage: "camera") {
                    CameraView()
                }
                Tab("Goals", systemImage: "shield") {
                    GoalsView()
                }
                Tab("Challenges", systemImage: "checkmark") {
                    ChallengesView()
                }
            }
            .tint(.green)
        }
    }
}
#Preview {
    ContentView()
}
