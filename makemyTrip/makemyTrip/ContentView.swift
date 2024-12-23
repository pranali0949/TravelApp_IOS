import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                StartView()
            } else {
                ZStack {
                   
                    Color.yellow
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                    
                        Text("Welcome to MakeMyTrip")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .opacity(self.isActive ? 1 : 0)
                            .animation(.easeIn(duration: 1.0).delay(0.5), value: isActive)
                    }
                    .onAppear {
                        //  after 5 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
