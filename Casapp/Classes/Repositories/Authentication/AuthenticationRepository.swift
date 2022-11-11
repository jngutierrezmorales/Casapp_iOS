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
    
    func signIn(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationService.signIn(email: email, password: password, completionBlock: completionBlock)
    }
}
