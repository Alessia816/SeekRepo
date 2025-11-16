//
//  SpeciesnearbyView.swift
//  Seek(HIG)
//
//  Created by Alessia Villano on 08/11/25.
//

import SwiftUI
import CoreLocation
import Combine


struct Species: Identifiable {
    let id = UUID()
    let name: String
    let scientificName: String
    let category: String
    let latitude: Double
    let longitude: Double
    let imageName: String
    
    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
}
        
        let speciesData: [Species] = [
            Species(name: "Hawaiian Beet Webworm moth", scientificName: "Spoladea recurvalis", category: "Insects", latitude: 40.8377, longitude: 14.3136, imageName: "1"),
            Species(name: "Old World Swallowtail", scientificName: "Papilio machaon", category: "Insects", latitude: 40.8377, longitude: 14.3136, imageName: "2"),
            Species(name: "Sloe bug", scientificName: "Dolycoris baccarum", category: "Insects", latitude: 40.8377, longitude: 14.3136, imageName: "3"),
            Species(name: "Cream-spot Tiger", scientificName: "Arctia villica", category: "Insects", latitude: 40.8377, longitude: 14.3136, imageName: "4"),
            Species(name: "Southern Green Stink Bug", scientificName: "Nezara viridula", category: "Insects", latitude: 40.8377, longitude: 14.3136, imageName: "5"),
            Species(name: "Red-cage Fungus", scientificName: "Clathrus ruber", category: "Fungi", latitude: 40.8377, longitude: 14.3136, imageName: "6"),
            Species(name: "Chinese Wisteria", scientificName: "Wisteria sinensis", category: "Plants", latitude: 40.8377, longitude: 14.3136, imageName: "7"),
            Species(name: "Smooth Golden Fleece", scientificName: "Urospermum dalechampii", category: "Plants", latitude: 40.8377, longitude: 14.3136, imageName: "8"),
            Species(name: "Tassel Hyacinth", scientificName: "Muscari comosum", category: "Plants", latitude: 41.9028, longitude: 12.4964, imageName: "9")
        ]
        
func nearbySpecies(from species: [Species], location: CLLocation?, radius: Double = 60000) -> [Species] {
    guard let location = location
    else { return [] }
    return species.filter
    { $0.location.distance(from: location) <= radius}
}
    
struct SpeciesnearbyView: View {
    @ObservedObject var locationManager: LocationManager
    
    @State private var selectedCategory: String = "All species"
    
    private let categories = ["All species", "Amphibians", "Arachnids", "Birds", "Fish", "Fungi", "Insects", "Mammals", "Mollusks", "Plants", "Reptiles", "Other species"]
    
    private var nearby: [Species] {
            guard let location = locationManager.location else { return [] }
            var list = nearbySpecies(from: speciesData, location: location)
            if selectedCategory != "All species" {
                list = list.filter { $0.category == selectedCategory }
            }
            return list
        }
    
    var body: some View {
            
            if locationManager.location != nil{
                
                VStack(alignment: .leading, spacing: 15){
                    Menu {
                        ForEach(categories, id: \.self) { category in
                            Button(category) {
                                selectedCategory = category
                            }
                        }
                    } label: {
                        Label("\(selectedCategory)", systemImage: "line.3.horizontal.decrease")
                            .padding(10)
                    }
                    
                    if nearby.isEmpty {
                        ContentUnavailableView("No species nearby", systemImage: "exclamationmark.triangle")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.systemGray6)))
                        Spacer()
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(nearby) { species in
                                    VStack {
                                        Image(species.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
                                        Text(species.name)
                                            .font(.caption)
                                            .frame(width: 100, alignment: .center)
                                        Spacer()
                                    }
                                }
                            }
                        }
                      
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6)))
            } else {
                Text("Position recovery in progress...")
                    .padding()
            }
        }
    }
#Preview {
    HomeView()
}
          
