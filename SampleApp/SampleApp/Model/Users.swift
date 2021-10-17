//
//  Users.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 14/09/21.
//

import Foundation

struct UserFormModel: Decodable {
    let id: Int
    let name: String
    let email: String
}

extension UserFormModel {
    func isValidName() -> Bool {
        
        return name.count > 1
    }
    
    func isValidEmail() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

