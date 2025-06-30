import XCTest
@testable import EV_Station_Finder

final class EVStationSearchViewModelTests: XCTestCase {
    var SUT: EVStationSearchViewModel!
    var mockFuelStationFinderService: FuelStationFinderServiceMock!
    var mockDataPersistenceService: DataPersistenceServiceMock!
    var mockZipCodeValidator: ZipCodeValidatorMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockFuelStationFinderService = FuelStationFinderServiceMock()
        mockDataPersistenceService = DataPersistenceServiceMock()
        mockZipCodeValidator = ZipCodeValidatorMock()
        SUT = EVStationSearchViewModel(service: mockFuelStationFinderService, zipCodeValidator: mockZipCodeValidator, dataPersistenceService: mockDataPersistenceService)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        SUT = nil
        mockFuelStationFinderService = nil
        mockZipCodeValidator = nil
        mockDataPersistenceService = nil
    }
    
    func test_givenStationsFinderServiceSucceed_whenSearchButtonTapped_thenShouldUpdateParametersForSuccess() {
        // GIVEN
        let expectedStation = FuelStation(
            stationName: "Test Station",
            streetAddress: "123 Test St",
            city: "Testville",
            state: "TS",
            country: "US",
            zip: "12345",
            latitude: 0,
            longitude: 0,
            fuelTypeCode: "",
            evConnectorTypes: nil
        )
        mockFuelStationFinderService.result = .success([expectedStation])
        
        // WHEN
        SUT.searchButtonTapped()
        
        // THEN
        let expectation = XCTestExpectation(description: "Fetch stations success")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
            XCTAssertFalse(SUT.isLoading)
            XCTAssertEqual(SUT.stations?.count, 1)
            XCTAssertEqual(SUT.stations?.first?.stationName, "Test Station")
            XCTAssertNil(SUT.errorMessage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_givenStationsFinderServiceFails_whenSearchButtonTapped_thenShouldUpdateParametersForError() {
        // GIVEN
        let expectedError = FuelStationFinderError.noData
        mockFuelStationFinderService.result = .failure(expectedError)
        
        // WHEN
        SUT.searchButtonTapped()
        
        // THEN
        let expectation = XCTestExpectation(description: "Fetch stations error")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
            XCTAssertFalse(SUT.isLoading)
            XCTAssertNil(SUT.stations)
            XCTAssertEqual(SUT.errorMessage, expectedError.errorDescription)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_given_whenSearchButtonTapped_thenShouldPersistZipCode() {
        // GIVEN
        let expectedZipCode = "12345"
        
        // WHEN
        SUT.zipCode = expectedZipCode
        SUT.searchButtonTapped()
        
        // THEN
        let expectation = XCTestExpectation(description: "Zip code persisted")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
            XCTAssertEqual(mockDataPersistenceService.persistedZipCode, expectedZipCode)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
