//
//  CameraTab.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 16/11/25.
//
import AVFoundation
import SwiftUI
import Combine

final class CameraAuthorization: ObservableObject {
    @Published var authorized = false
    @Published var showDeniedAlert = false

    func request() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.authorized = true

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    self.authorized = granted
                    if !granted { self.showDeniedAlert = true }
                }
            }

        case .denied, .restricted:
            self.showDeniedAlert = true

        @unknown default:
            self.showDeniedAlert = true
        }
    }
}
