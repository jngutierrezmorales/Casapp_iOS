//
//  PublishViewModel.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

enum PublishState {
    case INITIAL
    case SUCCESS
}

final class PublishViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var currentState: PublishState = .INITIAL
    @Published var home: HomeDto = HomeDto()
    @Published var messageError: String?
    
    init(homeRepository: HomeRepository = HomeRepository(homeService: HomeService())) {
        self.homeRepository = homeRepository
    }
    
    func publishHome(homeDto: HomeDto) {
        homeRepository.publishHome(homeDto: homeDto)
    }
}
