//
//  AuthenticationService.swift
//  Casapp
//
//  Created by Juan Gutierrez on 11/11/22.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationService {
    private var auth = Auth.auth()
    
    func signIn(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Login error \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            
            let email = result?.user.email ?? "No email"
            print("Login success for account: \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
}
