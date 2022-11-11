//
//  LoginViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var user: User?
    @Published var messageError: String?
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository(authenticationService: AuthenticationService())) {
        self.authenticationRepository = authenticationRepository
    }
    
    func signIn(email: String, password: String) {
        authenticationRepository.signIn(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
}
