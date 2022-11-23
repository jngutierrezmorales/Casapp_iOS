//
//  DetailViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum DetailState {
    case INITIAL
    case SUCCESS
}

final class DetailViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: HomeState = .INITIAL
    @Published var home: Home = Home()
    @Published var messageError: String?
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
    }
    
    func fetchHomeDetail(homeId: String) {
        homeRepository.fetchHomeDetail(id: homeId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let homeDto):
                self.home = homeDto.toModel()
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
    
    func updateFavorite(home: Home, isFavorite: Bool) {
        homeRepository.updateFavorite(home: home, isFavorite: isFavorite)
    }
}
