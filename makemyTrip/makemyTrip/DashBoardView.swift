import SwiftUI

struct DashBoardView: View {
    var body: some View {
        TabView {
            // Home
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            // Booking
            BookingView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Booking")
                }
            
            // Settings
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.pink)
        
    }
}

// Preview for DashBoardView
struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
