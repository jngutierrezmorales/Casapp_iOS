//
//  HomeViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum HomeState {
    case INITIAL
    case SUCCESS
}

final class HomeViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: HomeState = .INITIAL
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
    }
    
    func loadHomes() {
        homeRepository.loadHomes()
    }
}
