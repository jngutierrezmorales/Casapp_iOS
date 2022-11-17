//
//  LoginViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum LoadingState {
    case INITIAL
    case SUCCESS
}

final class LoginViewModel: ObservableObject {
    private let authenticationRepository: AuthenticationRepository
    @Published var currentState: LoadingState = .INITIAL
    @Published var user: UserService?
    @Published var messageError: String?
    @Published var loginError: Bool = false
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository(authenticationService: AuthenticationService())) {
        self.authenticationRepository = authenticationRepository
    }
    
    func signIn(email: String, password: String) {
        authenticationRepository.signIn(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
                self.currentState = .SUCCESS
            case .failure(let error):
                self.messageError = error.localizedDescription
                self.loginError = true
            }
        }
    }
}
