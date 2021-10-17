//
//  ApiManager.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 17/10/21.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    private init() {}
    
    func getUsers(completion: @escaping (Result<[UserFormModel], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UserFormModel].self, from: data)
                completion(.success(users))
            } catch (let error){
                completion(.failure(error))
            }
        }.resume()
    }
}
