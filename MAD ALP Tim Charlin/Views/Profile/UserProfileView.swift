import SwiftUI

struct UserProfileView: View {
    @StateObject private var user = User.loadFromUserDefaults()
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(user.name)
                        .font(.system(size: 30))
                    ProfileTextContainer(titleText: "Total Time", text:"364d 23h")
                        .padding(12)
                    HStack {
                        ProfileTextContainer(titleText: "Age", text: calculateAge(birthDate: user.birthDate))
                        ProfileTextContainer(titleText: "DOB", text: formatDate(date: user.birthDate))
                    }.padding(12)
                    ProfileTextContainer(titleText: "Place", text: user.place)
                        .padding(12)
                }
            }
            HStack {
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text("Edit User Credentials")
                        .padding()
                        .frame(minWidth:100, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(4)
                }
                .sheet(isPresented: $isEditing) {
                    UserProfileEditView(user: user)
                }
            }
        }.padding(16)
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    private func calculateAge(birthDate: Date) -> String {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year ?? 0
        return "\(age)"
    }
}

struct UserProfileEditView: View {
    @ObservedObject var user: User
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var birthDate: Date = Date()
    @State private var place: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Name", text: $name)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                    TextField("Place", text: $place)
                }
                
                Button(action: {
                    saveChanges()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .frame(minWidth:0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Edit Profile", displayMode: .inline)
            .onAppear {
                loadUserData()
            }
        }
    }
    
    private func loadUserData() {
        name = user.name
        birthDate = user.birthDate
        place = user.place
    }
    
    private func saveChanges() {
        user.name = name
        user.birthDate = birthDate
        user.place = place
        user.saveToUserDefaults()
    }
}

#Preview {
    UserProfileView()
}
