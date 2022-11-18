//
//  HomeViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation
import FirebaseFirestore

enum HomeState {
    case INITIAL
    case SUCCESS
}

final class HomeViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: HomeState = .INITIAL
    @Published var homes: [HomeDto] = []
    @Published var messageError: String?
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
        fetchHomes()
    }
    
    func fetchHomes() {
        homeRepository.fetchHomes() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let homes):
                self.homes = homes
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
    
//    func loadHomes() -> [HomeDto] {
//        return homeRepository.loadHomes()
//    }
}
