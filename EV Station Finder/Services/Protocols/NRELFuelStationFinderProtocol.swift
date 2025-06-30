import Foundation

protocol NRELFuelStationFinderProtocol: FuelStationFinderServiceProtocol {
    var fuelType: String { get }
    var NRELBaseUrl: String? { get }
    var NRELApiKey: String? { get }
    func getUrl(zipCode: String) -> URL?
}

extension NRELFuelStationFinderProtocol {
    var NRELBaseUrl: String? {
        return Bundle.main.infoDictionary?["NRELBaseUrl"] as? String
    }
    
    var NRELApiKey: String? {
        return Bundle.main.infoDictionary?["NRELApiKey"] as? String
    }
    
    func getUrl(zipCode: String) -> URL? {
        if let baseUrl = NRELBaseUrl, let apiKey = NRELApiKey,
           let url = URL(string: baseUrl + "v1.json?fuel_type=\(fuelType)&zip=\(zipCode)&api_key=\(apiKey)") {
            return url
        }
        return nil
    }
    
    func fetchStations(zipCode: String, completion: @escaping (Result<[FuelStation], FuelStationFinderError>) -> Void) {
        guard let url = getUrl(zipCode: zipCode) else {
            DispatchQueue.main.async {
                completion(.failure(FuelStationFinderError.invalidURL))
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error description: \(error.localizedDescription)")
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
