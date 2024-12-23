import SwiftUI

struct HomeView: View {
    // Sample data for tour packages
    let tourPackages = [
        TourPackage(imageName: "tour1", title: "Paris Getaway", description: "Explore the city of lights with our 5-day tour."),
        TourPackage(imageName: "tour2", title: "Tropical Paradise", description: "Enjoy a relaxing week in the Maldives."),
        TourPackage(imageName: "tour3", title: "Mountain Adventure", description: "Hike the stunning trails of the Swiss Alps."),
        // Add more packages as needed
    ]
    
    // Sample data for top hotels
    let topHotels = [
        Hotel(imageName: "hotel1", name: "Hotel de Paris", location: "Paris, France", pricePerNight: 150),
        Hotel(imageName: "hotel2", name: "Beachfront Resort", location: "Maldives", pricePerNight: 300),
        Hotel(imageName: "hotel3", name: "Alpine Lodge", location: "Swiss Alps", pricePerNight: 200),
        Hotel(imageName: "hotel4", name: "Spectrum Hotel", location: "Udaipur", pricePerNight: 100),
        // Add more hotels as needed
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Tour Packages Section
                    Text("Tour Packages")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    // Horizontal scroll view for tour packages
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(tourPackages) { package in
                                TourPackageCard(package: package)
                            }
                        }
                        .padding()
                    }
                    
                    // Top Hotels Section
                    Text("Top Hotels for Vacation")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    // Vertical list view for top hotels
                    ForEach(topHotels) { hotel in
                        NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                            HotelCard(hotel: hotel)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

// Sample data model for tour packages
struct TourPackage: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

// Tour Package Card View
struct TourPackageCard: View {
    let package: TourPackage
    
    var body: some View {
        VStack {
            Image(package.imageName) // Ensure these images exist in your asset catalog
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(package.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .padding(.top, 5)
            
            Text(package.description)
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.top, 2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Sample data model for hotels
struct Hotel: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let location: String
    let pricePerNight: Int
}

// Hotel Card View
struct HotelCard: View {
    let hotel: Hotel
    
    var body: some View {
        HStack {
            Image(hotel.imageName) // Ensure these images exist in your asset catalog
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(hotel.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(hotel.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Hotel Detail View
struct HotelDetailView: View {
    let hotel: Hotel
    
    var body: some View {
        VStack {
            Image(hotel.imageName) // Ensure these images exist in your asset catalog
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .clipped()
                .cornerRadius(10)
                .padding()
            
            Text(hotel.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 2)
            
            Text(hotel.location)
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            Text("Price per Night: $\(hotel.pricePerNight)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .navigationTitle(hotel.name)
        .background(Color.white.ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
