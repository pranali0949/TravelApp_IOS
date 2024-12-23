import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var isEmailSent: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
                .padding()
            Text("Enter your email address to \n receive a password reset link.")
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .textInputAutocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding(.horizontal, 20)
            
            Button(action: {
                // Send the password reset link
                sendPasswordResetLink()
            }) {
                Text("Send Reset Link")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 200, height: 50)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Password Reset"),
                  message: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
    
    private func sendPasswordResetLink() {
        guard isValidEmail(email) else {
            // Invalid email format
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        // Send password reset email
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                // Error sending password reset email
                alertMessage = "Failed to send password reset email. \(error.localizedDescription)"
            } else {
                // Success
                alertMessage = "A password reset link has been sent to your email."
            }
            showAlert = true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z|a-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
