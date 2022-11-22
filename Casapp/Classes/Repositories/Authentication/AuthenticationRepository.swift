//
//  AuthenticationRepository.swift
//  Casapp
//
//  Created by Juan Gutierrez on 11/11/22.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationService: AuthenticationService
    
    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }
    
    func signIn(email: String, password: String, completionBlock: @escaping (Result<UserService, Error>) -> Void) {
        authenticationService.signIn(email: email, password: password, completionBlock: completionBlock)
    }
    
    func signUp(email: String, password: String, completionBlock: @escaping (Result<UserService, Error>) -> Void) {
        authenticationService.signUp(email: email, password: password, completionBlock: completionBlock)
    }
    
    func signOut() -> Bool {
        return authenticationService.signOut()
    }
    
    func getUser() -> User {
        let user = authenticationService.getUser()
        
        if user == nil {
            return User()
        } else {
            return User(
                id: user?.uid,
                email: user?.email
            )
        }
    }
    
    func getUserBool() -> Bool {
        return authenticationService.getUserBool()
    }
    
    func updatePassword(password: String) {
        authenticationService.updatePassword(password: password)
    }
}
