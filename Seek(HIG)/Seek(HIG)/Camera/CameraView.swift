//
//  CameraView.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 16/11/25.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @StateObject private var auth = CameraAuthorization()
    @State private var showCameraSettingsAlert = false
    @State private var session = AVCaptureSession()
    @State private var output = AVCapturePhotoOutput()

    var body: some View {
        ZStack {
            if auth.authorized {
                CameraPreview(session: session)
                    .ignoresSafeArea()
                    .onAppear { configureSession() }
            } else {
                VStack {
                    Text("Camera Access Required")
                        .font(.headline)
                        .padding()
                    Button("Allow Access") {
                        showCameraSettingsAlert = true
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                    
                }
            }
        }
        .onAppear { auth.request() }
        .alert("Camera Access Needed",
               isPresented: $showCameraSettingsAlert) {
            Button("Open Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please enable Camera access in Settings to capture and identify new species.")
        }
    }

    // MARK: Camera Setup (from official AVFoundation session configuration)
    private func configureSession() {
        session.beginConfiguration()

        // Device
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                   for: .video,
                                                   position: .back),
              let input = try? AVCaptureDeviceInput(device: device)
        else { return }

        // Add Input
        if session.canAddInput(input) {
            session.addInput(input)
        }

        // Add Output
        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        session.commitConfiguration()
        DispatchQueue.global(qos: .userInitiated).async{
            session.startRunning()
        }
    }
}

