//
//  APIManager.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 27/09/21.
//

import Foundation

class APIManager {
    let urlSession: URLSession
    static let shared = APIManager()
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func getUsers(completion: @escaping (Result<[UserFormModel], Error>) -> Void ) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        let url = URL(string: urlString)!
        
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            // Check response code.
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(Result.failure(APIResponseError.inavlidResponse))
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let users = try JSONDecoder().decode([UserFormModel].self, from: data)
                completion(.success(users))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}

enum APIResponseError : String, Error {
    case inavalidUsername  = "This username created a invalid request. Plese try again."
    case unableToComplete  = "Unable to complete your request. PLease check your internet connection."
    case inavlidResponse   = "Invalid response from the server.Please try again."
    case invalidData       = "The data recieved from the server was invalid. Please try again."
    case unableToFavorite  = "There was an error favoriting the user . Please try again later "
    case alreadyInFavorites = "You've already favorited user. You mut REALLY like them."
}
