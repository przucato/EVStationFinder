import SwiftUI

struct EVStationSearchView: View {
    @StateObject var viewModel: EVStationSearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                ZipCodeSearchView(searchButtonHandler: { zipCode in
                    viewModel.zipCode = zipCode
                    viewModel.searchButtonTapped()
                }, zipCodeValidator: viewModel.zipCodeValidator, zipCode: $viewModel.zipCode)

                if viewModel.isLoading {
                    ProgressView("Loading stations...")
                        .padding()
                }

                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }

                List(viewModel.stations ?? []) { station in
                    NavigationLink {
                        StationDetailView(viewModel: StationDetailViewModel(mapService: AppleMapsService(), fuelStation: station))
                    } label: {
                        FuelStationCellView(fuelStation: station)
                    }
                }.overlay(Group {
                    if viewModel.isLoading == false && viewModel.stations?.isEmpty ?? false {
                        Text("Looks like there's no stations near you...")
                    }
                })
            }
            .navigationTitle("EV Stations")
        }.onAppear {
            viewModel.checkForLastSearchedZipCode()
        }
    }
}
