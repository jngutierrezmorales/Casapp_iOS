//
//  SplashViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum SplashState {
    case LOADING
    case SUCCESS
}

final class SplashViewModel: ObservableObject {
    private let authenticationRepository: AuthenticationRepository
    @Published var currentState: SplashState = .LOADING
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository(authenticationService: AuthenticationService())) {
        self.authenticationRepository = authenticationRepository
    }
    
    func getUser() -> Bool {
        let user = authenticationRepository.getUserBool()
        currentState = .SUCCESS
        return user
    }
}
