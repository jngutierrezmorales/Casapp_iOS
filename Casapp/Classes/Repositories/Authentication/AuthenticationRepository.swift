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
    
    func getUser() -> Bool {
        return authenticationService.getUser()
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
}
