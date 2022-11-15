//
//  MainViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository(authenticationService: AuthenticationService())) {
        self.authenticationRepository = authenticationRepository
    }
    
    func signOut() -> Bool {
        return authenticationRepository.signOut()
    }
}
