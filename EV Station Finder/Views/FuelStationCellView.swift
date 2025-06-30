import SwiftUI

struct FuelStationCellView: View {
    let fuelStation: FuelStation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fuelStation.station_name)
                .font(.headline)
            Text("\(fuelStation.street_address), \(fuelStation.city), \(fuelStation.state) \(fuelStation.zip)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    FuelStationCellView(fuelStation: FuelsStationMock.mock[0])
}
