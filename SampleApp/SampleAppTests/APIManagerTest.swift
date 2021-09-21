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
        apiManager.getMovies { movies, error in  }
        
    }
}
