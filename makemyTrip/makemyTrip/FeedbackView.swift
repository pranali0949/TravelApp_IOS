import SwiftUI
import FirebaseFirestore

struct FeedbackView: View {
    @State private var rating: Int = 0
    @State private var feedback: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    private let db = Firestore.firestore()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Rate Your Experience")
                    .font(.headline)
                    .padding(.top)
                    .foregroundColor(.blue)

                // Rating System
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: self.rating >= index ? "star.fill" : "star")
                            .foregroundColor(self.rating >= index ? .yellow : .gray)
                            .onTapGesture {
                                self.rating = index
                            }
                    }
                }

                // Feedback Text Field
                Text("Leave your feedback")
                    .font(.headline)
                    .foregroundColor(.orange)
                TextEditor(text: $feedback)
                    .border(Color.gray, width: 1)
                    .frame(height: 150)
                    .padding(.bottom, 10)

                // Submit Button
                Button(action: {
                    submitFeedback()
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Thank You!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Feedback")
        }
    }

    private func submitFeedback() {
        // Check for empty fields
        guard !feedback.isEmpty, rating > 0 else {
            alertMessage = "Please fill in all fields."
            showAlert = true
            return
        }

        // Create a dictionary for the feedback data
        let feedbackData: [String: Any] = [
            "rating": rating,
            "feedback": feedback,
            "timestamp": Timestamp()
        ]

        // Add feedback to Firestore
        db.collection("feedbacks").addDocument(data: feedbackData) { error in
            if let error = error {
                // Log error and show alert
                print("Error adding document: \(error.localizedDescription)")
                alertMessage = "Error submitting feedback. Please try again later."
                showAlert = true
            } else {
                // Show confirmation alert
                alertMessage = "Your feedback has been submitted."
                showAlert = true

                // Clear the fields
                feedback = ""
                rating = 0
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
