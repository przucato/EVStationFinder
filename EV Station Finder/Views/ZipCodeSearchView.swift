import SwiftUI

struct ZipCodeSearchView: View {
    var searchButtonHandler: (String) -> Void
    var zipCodeValidator: ZipCodeValidatorProtocol
    
    @Binding var zipCode: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if !zipCode.isEmpty {
                Text("Enter ZIP code")
                    .font(.caption)
                    .padding(.leading)
            }
            HStack {
                TextField("Enter ZIP code", text: $zipCode)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                
                Button("Search") {
                    searchButtonHandler(zipCode)
                }
                .padding(.trailing)
                .disabled(!zipCodeValidator.isValid(zipCode: zipCode))
            }
            if !zipCodeValidator.isValid(zipCode: zipCode) {
                Text(zipCodeValidator.invalidZipCodePrompt)
                    .font(.caption)
                    .padding(.leading)
            }
        }.textFieldStyle(.roundedBorder)
    }
}
