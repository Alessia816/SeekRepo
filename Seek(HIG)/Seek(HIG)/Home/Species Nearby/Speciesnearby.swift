//
//  Speciesnearby.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 08/11/25.
//


import SwiftUI
import CoreLocation

struct Speciesnearby: View {
    @StateObject private var locationManager = LocationManager()
    @State private var showLocationSettingsAlert = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Species nearby")
                .font(.title2)
                .foregroundColor(.green)
            
            VStack {
                if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
                    SpeciesnearbyView(locationManager: locationManager)
                } else {
                    VStack(spacing: 12) {
                        HStack(alignment: .center, spacing: 15) {
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 50)
                                .foregroundColor(.green)
                                .padding(20)
                            Text("Please enable your location to visualize species nearby.")
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        
                        Button("Enable location") {
                            
                            switch locationManager.authorizationStatus {
                            case .notDetermined:
                                // First tap
                                locationManager.requestPermission()
                            case .denied, .restricted:
                                // Second tap
                                showLocationSettingsAlert = true
                            case .authorizedWhenInUse, .authorizedAlways:
                                locationManager.startUpdating()
                                // Show scrollView
                            @unknown default:
                                break
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        .tint(.green)
                        .alert("Location Access Needed",
                               isPresented: $showLocationSettingsAlert,
                               actions: {
                            Button("Cancel", role: .cancel) {}
                            Button("Open Settings") {
                                if let url = URL(string: UIApplication.openSettingsURLString) {
                                    openURL(url)
                                }
                            }
                        },
                               message: {
                            Text("Please enable Location access in Settings to see species nearby.")
                        }
                        )
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6)))
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
