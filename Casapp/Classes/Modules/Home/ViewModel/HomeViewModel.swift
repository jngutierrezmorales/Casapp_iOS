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
    @Published var homes = [HomeDto]()
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
    }
    
    func loadHomes() -> [HomeDto] {
        return homeRepository.loadHomes()
    }
}
