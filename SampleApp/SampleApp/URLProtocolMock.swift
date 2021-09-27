//
//  URLProtocolMock.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 27/09/21.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    //Handler to test the request and return mock response.
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func stopLoading() {

    }
    override func startLoading() {
         guard let handler = MockURLProtocol.requestHandler else {
            return
        }
        do {
            //Call handler with received request and capture the tuple of response and data.
            let (response, data)  = try handler(request)
            //Send received response to the client.
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            //Send received data to the client.
            client?.urlProtocol(self, didLoad: data)
            //Notify request has been finished.
            client?.urlProtocolDidFinishLoading(self)
        } catch  {
            // Notify received error.
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}
