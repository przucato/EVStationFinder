import SwiftUI

struct FuelStationCellView: View {
    let fuelStation: FuelStation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fuelStation.stationName)
                .font(.headline)
            Text(fuelStation.fullAddress)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
