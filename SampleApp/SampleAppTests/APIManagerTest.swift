//
//  APIManagerTest.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 27/09/21.
//

import XCTest
@testable import SampleApp

class APIManagerTest: XCTestCase {
    
    var apiManager: APIManager!
    var expectation: XCTestExpectation!
    let apiURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        
        apiManager = APIManager(urlSession: urlSession)
        expectation = expectation(description: "Expectation")
    }
    
    func testSuccessfulResponse() {
        // Prepare mock response
        let jsonString = """
                            [{
                            "id": 1,
                            "name": "Leanne Graham",
                            "username": "Bret",
                            "email": "Sincere@april.biz",
                            "address": {
                              "street": "Kulas Light",
                              "suite": "Apt. 556",
                              "city": "Gwenborough",
                              "zipcode": "92998-3874",
                              "geo": {
                                "lat": "-37.3159",
                                "lng": "81.1496"
                              }
                            },
                            "phone": "1-770-736-8031 x56442",
                            "website": "hildegard.org",
                            "company": {
                              "name": "Romaguera-Crona",
                              "catchPhrase": "Multi-layered client-server neural-net",
                              "bs": "harness real-time e-markets"
                            }
                            }]
                        """
        let data = jsonString.data(using: .utf8)!
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url, url == self.apiURL else {
                throw APIResponseError.inavlidResponse
            }
            
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        // Call API.
        apiManager.getUsers { (result) in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
            case .failure(let error):
                XCTFail("Error was not expected: \(error)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

