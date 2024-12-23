import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingDashboardView: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                    
               
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    // Password Field
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                    
                    // Sign In Button
                    Button(action: {
                        signIn()
                    }) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    HStack {
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.pink)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: SignupView()) {
                            Text("Don't Have an Account?")
                                .font(.footnote)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                
                Spacer()
            }
            .background(Color.pink.ignoresSafeArea())
            .background(
                NavigationLink(destination: DashBoardView(), isActive: $isShowingDashboardView) {
                    EmptyView()
                }
            )
        }
    }
    
    private func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = "Error: \(error.localizedDescription)"
            } else {
                isShowingDashboardView = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
