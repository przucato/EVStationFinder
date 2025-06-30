import Foundation
import MapKit

class StationDetailViewModel {
    private let mapService: MapServiceProtocol
    let fuelStation: FuelStation
    
    init(mapService: MapServiceProtocol,
         fuelStation: FuelStation) {
        self.mapService = mapService
        self.fuelStation = fuelStation
    }
    
    func openInMaps() {
        mapService.showInMapApp(latitude: fuelStation.latitude, longitude: fuelStation.longitude, itemName: fuelStation.stationName)
    }
}
