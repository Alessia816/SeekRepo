//
//  iNaturalist.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 08/11/25.
//
import SwiftUI

struct iNaturalist: View {
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("iNaturalist")
                .font(.title2)
                .foregroundColor(.green)
            
            let items = [
                ("arrow.trianglehead.2.counterclockwise", "Sync your observations across devices"),
                ("checkmark.shield.fill", "Get accurate, location-based identification suggestions"),
                ("binoculars.fill", "Add, edit, and manage all your observations in one place"),
                ("person.fill", "Follow people and see what your friends are observing")
            ]
            
            VStack(alignment: .leading, spacing: 1) {
                HStack(alignment: .center, spacing: 8) {
                    Image("iNaturalist")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .shadow(radius: 2)
                        .padding()
                    Text("Dive deeper with iNaturalist.")
                }
                
                ForEach(items, id: \.1) { icon, label
                    in
                    HStack(alignment: .center, spacing: 15) {
                        Image(systemName: icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, alignment: .centerFirstTextBaseline)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                            .padding()
                            .padding(.leading, 15)
                        Text(label)
                            .font(.subheadline)
                           Spacer()
                    }
                }
               Spacer()
                
                Link("Learn more about iNaturalist", destination: URL(string: "https://www.inaturalist.org")!)
                    .foregroundColor(.green)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Button("Log in with iNaturalist") {
                    showModal = true
                }
                .buttonStyle(.bordered)
                .tint(.green)
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .sheet(isPresented: $showModal) {
                ModalView()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
            )
        }
    }
}
#Preview {
    HomeView()
}
