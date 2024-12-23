import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            ZStack {
        
                Image("globe")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) //
                VStack {
                    Spacer()
                
                    Text("Welcome to MakeMyTrip")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                        .padding()
                        .padding(.top, 150)
                    
                    Spacer()
                   
                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50)
                            .background(Color.white)
                            .foregroundColor(.pink)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 10)
           
                    NavigationLink(destination: SignupView()) {
                        Text("Sign Up")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
