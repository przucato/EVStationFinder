import SwiftUI

struct StationDetailView: View {
    let viewModel: StationDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.fuelStation.stationName)
                .font(.title)
                .fontWeight(.bold)

            Text(viewModel.fuelStation.fullAddress)
                .font(.body)
                .foregroundColor(.secondary)

            Button(action: viewModel.openInMaps) {
                Label("Open in Apple Maps", systemImage: "map")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Station Details")
    }
}
