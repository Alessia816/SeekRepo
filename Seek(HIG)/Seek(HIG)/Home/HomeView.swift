//
//  HomeView.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 06/11/25.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var showLocationSettingsAlert = false
    @Environment(\.openURL) private var openURL
    @State private var showModal = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    Speciesnearby()
                    Seekupdates()
                    Challenges()
                    iNaturalist()
                }
                .padding(.horizontal)
                .navigationTitle("Home")
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Label("Notifications", systemImage: "bell")
                    }
                    Button(action: {}) {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
