//
//  APIManager.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 19/09/21.
//

import Foundation

class APIManager {
    var session: URLSession!
    func getUsers(completion: @escaping([UserFormModel], Error?) -> Void ) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let users = try! JSONDecoder().decode([UserFormModel].self, from: data)
            completion(users, nil)
        }.resume()
    }
}
