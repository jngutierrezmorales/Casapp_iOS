//
//  HomeRepository.swift
//  Casapp
//
//  Created by Juan Gutierrez on 11/11/22.
//

import Foundation

final class HomeRepository {
    private let homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func fetchHomes(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homeService.fetchHomes(completionBlock: completionBlock)
    }
    
    func fetchHomesFavorites(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homeService.fetchHomesFavorites(completionBlock: completionBlock)
    }
    
    func fetchAds(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homeService.fetchAds(completionBlock: completionBlock)
    }
    
    func fetchHomeDetail(id: String, completionBlock: @escaping(Result<HomeDto, Error>) -> Void) {
        homeService.fetchHomeDetail(id: id, completionBlock: completionBlock)
    }
    
    func updateFavorite(home: Home, isFavorite: Bool) {
        homeService.updateFavorite(home: home, isFavorite: isFavorite)
    }
    
    func publishHome(homeDto: HomeDto) {
        homeService.publishHome(homeDto: homeDto)
    }
}
