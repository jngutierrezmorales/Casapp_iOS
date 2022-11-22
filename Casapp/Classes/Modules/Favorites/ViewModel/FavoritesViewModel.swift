//
//  FavoritesViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation
import FirebaseFirestore

enum FavoritesState {
    case INITIAL
    case SUCCESS
}

final class FavoritesViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: FavoritesState = .INITIAL
    @Published var favorites: [Home] = []
    @Published var homeId: String = ""
    @Published var messageError: String?
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
        fetchFavorites()
    }
    
    func fetchFavorites() {
        homeRepository.fetchHomesFavorites() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let homesDto):
                self.favorites = homesDto.map { homeDto in
                    homeDto.toModel()
                }
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
}
