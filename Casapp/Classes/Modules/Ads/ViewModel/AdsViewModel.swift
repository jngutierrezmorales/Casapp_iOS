//
//  AdsViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum AdsState {
    case INITIAL
    case SUCCESS
}

final class AdsViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: AdsState = .INITIAL
    @Published var ads: [Home] = []
    @Published var messageError: String?
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
        fetchAds()
    }
    
    func fetchAds() {
        homeRepository.fetchAds() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let homesDto):
                self.ads = homesDto.map { homeDto in
                    homeDto.toModel()
                }
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
}
