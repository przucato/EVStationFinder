import SwiftUI

struct EVConnectorsView: View {
    let connectors: [EVConnectors]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Connector types available:")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            ForEach(connectors, id: \.self) { connector in
                Label(connector.typeName, systemImage: "circle.fill")
            }
        }.padding(.top)
            .padding(.bottom)
    }
}
