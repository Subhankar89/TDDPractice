//
//  APIManagerTest.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 19/09/21.
//

import XCTest
@testable import SampleApp

class APIManagerTest: XCTestCase {

    func test_getUser_WithExpectedURLHostAndPath() {
        let apiManager = APIManager()
        let mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiManager.session = mockURLSession
        apiManager.getUsers { movies, error in  }
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "jsonplaceholder.typicode.com")
        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/users")
    }
    
    func test_getUser_WithSuccessReturnsofData() {
        
        let jsonData = """
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
                        """.data(using: .utf8)
        let apiManager = APIManager()
        let mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiManager.session = mockURLSession
        
        let usersExpectation = expectation(description: "users")
        var userResponse: [UserFormModel]?
        
        apiManager.getUsers { users, error in
            userResponse = users
            usersExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            XCTAssertNotNil(userResponse)
        }
    }
}
