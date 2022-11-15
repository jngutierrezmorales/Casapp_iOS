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
    private var user = Auth.auth().currentUser
    
    func getUser() -> Bool {
        if user?.uid != nil {
            return true
        } else {
            return false
        }
    }
    
    func signIn(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Login error \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            
            let user = result?.user.email ?? "User not found"
            print("Login success for account: \(user)")
            completionBlock(.success(.init(email: user)))
        }
    }
    
    func signUp(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Register error \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            
            let user = result?.user.email ?? "User not registered"
            print("Register success for account: \(user)")
            completionBlock(.success(.init(email: user)))
        }
    }
    
    func signOut() -> Bool {
        var logout = false
        
        do {
            try auth.signOut()
            logout = true
            print("Logout success")
        } catch let signOutError as NSError {
            print("Logout error %@", signOutError)
        }
        
        return logout
    }
}
