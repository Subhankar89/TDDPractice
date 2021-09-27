//
//  APIManagerTest.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 27/09/21.
//

import XCTest
@testable import SampleApp

class APIManagerTest: XCTestCase {
    
    func testGetMovieWithExpectedURLHostAndPath() {
        // this is the URL we expect to call
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")

        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: Data( """
        {
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
        }
        """.utf8)]

        // now set up a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        // and create the URLSession from that
        let session = URLSession(configuration: config)
        
        object.getUser(using: session) {
            XCTAssertEqual(user.purchaseCount, 0)
            expectation.fulfill()
        }
    }
}
