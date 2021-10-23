//
//  DoraCollectionTests.swift
//  DoraCollectionTests
//
//  Created by Sanjeev on 21/10/21.
//

import XCTest
@testable import DoraCollection

class DoraCollectionTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoraCollectionAPI() {
        let mockDoraCollection = MockDoraCollection()
        mockDoraCollection.hasCalledDoraListAPI = false
        let viewModel = DoraCollectionViewModel(aPISniperProtocol: mockDoraCollection)
        let exception = XCTestExpectation(description: "Dora Test")
        viewModel.getDoraCollection { (isSuccess) in
            XCTAssertNotEqual(isSuccess, mockDoraCollection.hasCalledDoraListAPI)
            exception.fulfill()
        }
        wait(for: [exception], timeout: 1.0)
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
class MockDoraCollection: APISniperProtocol {
    var hasCalledDoraListAPI = false
    func getDoraListingFromServer(completion: @escaping ((_ status: Bool, _ data: DoraCollectionModel?, _ error: Error?) -> Void)) {
        completion(!hasCalledDoraListAPI, nil, nil)
    }
}
