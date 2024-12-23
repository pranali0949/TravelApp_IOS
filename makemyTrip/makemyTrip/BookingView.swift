import SwiftUI
import FirebaseFirestore

struct BookingView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var mobileNumber: String = ""
    @State private var address: String = ""
    @State private var foodIncluded: Bool = false
    @State private var selectedTour: String = ""
    @State private var numberOfPeople: String = ""
    @State private var tourDate: Date = Date()
    @State private var numberOfDays: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    private let db = Firestore.firestore()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Information")
                                .font(.headline)
                                .foregroundColor(.blue)) {
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                        TextField("Mobile Number", text: $mobileNumber)
                            .keyboardType(.phonePad)
                        TextField("Address", text: $address)
                    }
                    
                    Section(header: Text("Booking Details")
                                .font(.headline)
                                .foregroundColor(.blue)) {
                        TextField("Tour Name", text: $selectedTour)
                        
                        TextField("Number of People", text: $numberOfPeople)
                            .keyboardType(.numberPad)
                        
                        DatePicker("Tour Date", selection: $tourDate, displayedComponents: [.date])
                            .datePickerStyle(WheelDatePickerStyle())
                        
                        TextField("Number of Days", text: $numberOfDays)
                            .keyboardType(.numberPad)
                        
                        Toggle(isOn: $foodIncluded) {
                            Text("Include Food")
                        }
                    }
                    
                    Section {
                        Button(action: {
                            bookTour()
                        }) {
                            Text("Book Now")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .background(Color(UIColor.systemPink).opacity(0.1).ignoresSafeArea())
                .navigationTitle("Book Your Tour")
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("😊"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("Let's go and explore!"))
                    )
                }
            }
        }
    }
    
    private func bookTour() {
        // Check for empty fields
        guard !name.isEmpty, !email.isEmpty, !mobileNumber.isEmpty, !address.isEmpty, !selectedTour.isEmpty, !numberOfPeople.isEmpty, !numberOfDays.isEmpty else {
            alertMessage = "Please fill in all fields."
            showAlert = true
            return
        }
        
        // Create a dictionary for the booking data
        let bookingData: [String: Any] = [
            "name": name,
            "email": email,
            "mobileNumber": mobileNumber,
            "address": address,
            "selectedTour": selectedTour,
            "numberOfPeople": numberOfPeople,
            "tourDate": Timestamp(date: tourDate),
            "numberOfDays": numberOfDays,
            "foodIncluded": foodIncluded
        ]
        
        // Add booking data to Firestore
        db.collection("bookings").addDocument(data: bookingData) { error in
            if let error = error {
                // Log error and show alert
                print("Error adding document: \(error.localizedDescription)")
                alertMessage = "Error submitting booking. Please try again later."
                showAlert = true
            } else {
                // Show confirmation alert
                alertMessage = "Your booking has been successfully submitted."
                showAlert = true

                // Clear the fields
                name = ""
                email = ""
                mobileNumber = ""
                address = ""
                selectedTour = ""
                numberOfPeople = ""
                numberOfDays = ""
                foodIncluded = false
            }
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
