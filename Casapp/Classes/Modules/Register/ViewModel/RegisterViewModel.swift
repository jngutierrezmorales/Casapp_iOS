//
//  RegisterViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum RegisterState {
    case INITIAL
    case SUCCESS
}

final class RegisterViewModel: ObservableObject {
    private let authenticationRepository: AuthenticationRepository
    @Published var currentState: RegisterState = .INITIAL
    @Published var user: User?
    @Published var messageError: String?
    @Published var registerError: Bool = false
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository(authenticationService: AuthenticationService())) {
        self.authenticationRepository = authenticationRepository
    }
    
    func signUp(email: String, password: String) {
        authenticationRepository.signUp(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
                self.currentState = .SUCCESS
            case .failure(let error):
                self.messageError = error.localizedDescription
                self.registerError = true
            }
        }
    }
}
