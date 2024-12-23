import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @State private var isShowingStartView: Bool = false
    @State private var isLoggedOut: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    // Profile Section
                    NavigationLink(destination: Text("History of your Tours")) {
                        Text("History")
                    }
                    .padding()
                    
                    // Security Section
                    NavigationLink(destination: Text("Security Settings")) {
                        Text("Security")
                    }
                    .padding()
                    
                    // Privacy Section
                    NavigationLink(destination: AboutUsView()) {
                        Text("About Us")
                    }
                    .padding()
                    
                    NavigationLink(destination: FeedbackView()) {
                        Text("Feedback")
                    }
                    .padding()
                    
                    NavigationLink(destination: Text("Privacy Details")) {
                        Text("Privacy")
                    }
                    .padding()
                    
                    // Logout Section
                    Button(action: {
                        logout()
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                
                Spacer()
                
                Image("makemytrip_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 200)
                    .padding(.bottom, 20)
            }
            .navigationTitle("Settings")
            .background(
                NavigationLink(
                    destination: StartView(),
                    isActive: $isShowingStartView
                ) {
                    EmptyView()
                }
            )
        }
        .onChange(of: isLoggedOut) { _ in
            if isLoggedOut {
             
            }
        }
    }
    
    private func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedOut = true
            isShowingStartView = true
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
