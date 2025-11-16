//
//  Untitled.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 08/11/25.
//
import SwiftUI

struct Seekupdates: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Seek updates")
                .font(.title2)
                .foregroundColor(.green)
            
            HStack(alignment: .center, spacing: 27) {
                Image(systemName: "camera.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 50)
                    .foregroundColor(.green)
                    .padding()
                VStack(alignment: .leading, spacing: 8) {
                    Text("We've updated our Identification Model!")
                        .font(.body)
                    Text("You can now identify over 80,000 species in the latest version of Seek!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
            )
        }
    }
}
