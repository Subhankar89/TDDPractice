//
//  MockURLSession.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 21/09/21.
//

import Foundation

class MockURLSession: URLSession {
    var cachedUrl: URL?
    
    override func dataTask(with url: URL, completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        
        return URLSessionDataTask()
    }
}
