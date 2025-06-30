import XCTest
@testable import EV_Station_Finder

final class EVFuelStationFinderServiceTests: XCTestCase {
    var SUT: EVFuelStationFinderService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        SUT = EVFuelStationFinderService()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        SUT = nil
    }
    
    func test_givenInvalidNumericZipCode_whenFetchStationsCalled_thenAPISucceedsWithNoStations() {
        // GIVEN
        let invalidZipCode = "1234"
        
        let expectation = XCTestExpectation(description: "Invalid numeric ZIP Code")
        
        // WHEN
        SUT.fetchStations(zipCode: invalidZipCode) { result in
            // THEN
            if case .success(let fuelStations) = result {
                XCTAssertEqual(fuelStations.count, 0)
            } else {
                XCTFail("Expected success with no result stations")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_givenInvalidZipCode_whenFetchStationsCalled_thenAPISucceedsWithNoStations() {
        // GIVEN
        let invalidZipCode = "abcd"
        
        let expectation = XCTestExpectation(description: "Invalid ZIP Code")
        
        // WHEN
        SUT.fetchStations(zipCode: invalidZipCode) { result in
            // THEN
            if case .success(let fuelStations) = result {
                XCTAssertEqual(fuelStations.count, 0)
            } else {
                XCTFail("Expected success with no result stations")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
