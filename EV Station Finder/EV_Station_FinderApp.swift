import SwiftUI

@main
struct EV_Station_FinderApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = EVStationSearchViewModel(service: EVFuelStationFinderService(),
                                                     zipCodeValidator: USZipCodeValidator(),
                                                     dataPersistenceService: UserDefaultsPersistenceService())
            EVStationSearchView(viewModel: viewModel)
        }
    }
}
