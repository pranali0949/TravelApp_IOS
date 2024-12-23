import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
           
                
                Text("Our Services")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Heading title color
                    .padding(.bottom, 5)
                
                Text("We offer a variety of travel services to help you plan your perfect trip. Our services include customized tour packages, hotel bookings, and travel consultations. Whether you are looking for a relaxing beach vacation or an adventurous hiking trip, we have the expertise and resources to make your travel dreams come true.")
                    .font(.body)
                    .padding(.bottom, 20)
                
                Text("Our Location")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Heading title color
                    .padding(.bottom, 5)
                
                Text("We are located in the heart of the city. Our office is easily accessible and open for consultations from 9 AM to 6 PM, Monday through Friday. You can visit us at:\n\n123 Travel Street,\nCity Name,\nCountry.")
                    .font(.body)
                    .padding(.bottom, 20)
                
                // Contact Details
                Text("Contact Us")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Heading title color
                    .padding(.bottom, 5)
                
                Text("For any inquiries or support, please reach out to us via:\n\nEmail: contact@makemytrip.com\nPhone: +123-456-7890\nWebsite: www.makemytrip.com")
                    .font(.body)
                
            }
            .padding()
        }
        .navigationTitle("About Us")
        .background(Color(UIColor.systemPink).opacity(0.1).ignoresSafeArea()) // Light pink background
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
