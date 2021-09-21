//
//  MockURLSession.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 21/09/21.
//

import Foundation

class MockURLSession: URLSession {
    var cachedUrl: URL?
    private let mockTask: MockTask
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, errors:
                                error)
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.cachedUrl = url
            mockTask.completionHandler = completionHandler
            return mockTask
        }
    }
}
