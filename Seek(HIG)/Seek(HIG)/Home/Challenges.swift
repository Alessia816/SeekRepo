//
//  Challenges.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 08/11/25.
//
import SwiftUI

struct Challenges: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Challenges")
                    .font(.title2)
                    .foregroundColor(.green)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("December 2024")
                Text("SOLSTICE CHALLENGE")
                    .font(.title3)
                HStack {
                    Image(systemName: "shield")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundColor(.green)
                        .padding()
                    Text("Add observations with the Seek Camera to earn the Challenge badge!")
                        .padding()
                }
                Button("Take the challenge") {
                    print()
                }
                .buttonStyle(.bordered)
                .tint(.green)
                .frame(maxWidth: .infinity, alignment: .center)
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
