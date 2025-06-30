import Foundation
class EVFuelStationFinderService: FuelStationFinderServiceProtocol, NRELFuelStationFinderProtocol {
    var fuelType = "ELEC"
    
    func fetchStations(zipCode: String, completion: @escaping (Result<[FuelStation], FuelStationFinderError>) -> Void) {
        guard let url = getUrl(zipCode: zipCode) else {
            DispatchQueue.main.async {
                completion(.failure(FuelStationFinderError.invalidURL))
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(FuelStationFinderError.unknown))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(FuelStationFinderError.noData))
                }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(NRELResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded.fuel_stations))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(FuelStationFinderError.decodingError))
                }
            }
        }.resume()
    }
}
