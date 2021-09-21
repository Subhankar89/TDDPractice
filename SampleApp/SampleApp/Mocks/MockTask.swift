//
//  MockTask.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 21/09/21.
//

import Foundation

class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let errors: Error?
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void) = { (_,_,_) in }
    
    init(data: Data?, urlResponse: URLResponse?, errors: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.errors = errors
    }
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler(self.data, self.urlResponse, self.errors)
        }
    }
}
