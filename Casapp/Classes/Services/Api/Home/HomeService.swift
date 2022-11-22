//
//  HomeService.swift
//  Casapp
//
//  Created by Juan Gutierrez on 11/11/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

final class HomeService {
    private let database = Firestore.firestore()
    @Published var homes: [HomeDto] = []
    private let user = AuthenticationRepository(authenticationService: AuthenticationService()).getUser().id
    private var homeDto: HomeDto = HomeDto()
    
    func fetchHomes(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homes.removeAll()
        
        let ref = database.collection("homes")
            .order(by: "publishTime", descending: true)
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "fetchHomes service error")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let homeId = data["homeId"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageUrl = data["imageUrl"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let size = data["size"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let latitude = data["latitude"] as? Double ?? 0.0
                    let longitude = data["longitude"] as? Double ?? 0.0
                    let phone = data["phone"] as? String ?? ""
                    let homeState = data["homeState"] as? String ?? ""
                    let userId = data["userId"] as? String ?? ""
                    let owner = data["owner"] as? String ?? ""
                    let publishTime = data["publishTime"] as? String ?? ""
                    let isPublished = data["isPublished"] as? Bool ?? true
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    
                    let home = HomeDto(
                        homeId: homeId,
                        title: title,
                        description: description,
                        imageUrl: imageUrl,
                        price: price,
                        size: size,
                        location: location,
                        latitude: latitude,
                        longitude: longitude,
                        phone: phone,
                        homeState: homeState,
                        userId: userId,
                        owner: owner,
                        publishTime: publishTime,
                        isPublished: isPublished,
                        isFavorite: isFavorite
                    )

                    self.homes.append(home)
                }
                completionBlock(.success(self.homes))
            }
        }
    }
    
    func fetchHomesFavorites(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homes.removeAll()
        
        let ref = database.collectionGroup("favorites")
            .whereField("userId", isEqualTo: user.valueOrEmpty)
            .whereField("isFavorite", isEqualTo: true)
            .order(by: "homeState", descending: true)
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "fetchHomesFavorites service error")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let homeId = data["homeId"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageUrl = data["imageUrl"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let size = data["size"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let latitude = data["latitude"] as? Double ?? 0.0
                    let longitude = data["longitude"] as? Double ?? 0.0
                    let phone = data["phone"] as? String ?? ""
                    let homeState = data["homeState"] as? String ?? ""
                    let userId = data["userId"] as? String ?? ""
                    let owner = data["owner"] as? String ?? ""
                    let publishTime = data["publishTime"] as? String ?? ""
                    let isPublished = data["isPublished"] as? Bool ?? true
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    
                    let home = HomeDto(
                        homeId: homeId,
                        title: title,
                        description: description,
                        imageUrl: imageUrl,
                        price: price,
                        size: size,
                        location: location,
                        latitude: latitude,
                        longitude: longitude,
                        phone: phone,
                        homeState: homeState,
                        userId: userId,
                        owner: owner,
                        publishTime: publishTime,
                        isPublished: isPublished,
                        isFavorite: isFavorite
                    )
                    
                    self.homes.append(home)
                }
                completionBlock(.success(self.homes))
            }
        }
    }
    
    func fetchAds(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        homes.removeAll()
        
        let ref = database.collectionGroup("homes")
            .whereField("owner", isEqualTo: user.valueOrEmpty)
            .whereField("isPublished", isEqualTo: true)
            .order(by: "publishTime", descending: true)
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "fetchAds service error")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let homeId = data["homeId"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageUrl = data["imageUrl"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let size = data["size"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let latitude = data["latitude"] as? Double ?? 0.0
                    let longitude = data["longitude"] as? Double ?? 0.0
                    let phone = data["phone"] as? String ?? ""
                    let homeState = data["homeState"] as? String ?? ""
                    let userId = data["userId"] as? String ?? ""
                    let owner = data["owner"] as? String ?? ""
                    let publishTime = data["publishTime"] as? String ?? ""
                    let isPublished = data["isPublished"] as? Bool ?? true
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    
                    let home = HomeDto(
                        homeId: homeId,
                        title: title,
                        description: description,
                        imageUrl: imageUrl,
                        price: price,
                        size: size,
                        location: location,
                        latitude: latitude,
                        longitude: longitude,
                        phone: phone,
                        homeState: homeState,
                        userId: userId,
                        owner: owner,
                        publishTime: publishTime,
                        isPublished: isPublished,
                        isFavorite: isFavorite
                    )
                    
                    self.homes.append(home)
                }
                completionBlock(.success(self.homes))
            }
        }
    }
    
    func fetchHomeDetail(id: String, completionBlock: @escaping(Result<HomeDto, Error>) -> Void) {
        let ref = database.collection("homes")
            .document(id)
        
        ref.getDocument {(document, error) in
            guard error == nil else {
                print("fetchHomeDetail error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                
                if let data = data {
                    self.homeDto.homeId = data["homeId"] as? String ?? ""
                    self.homeDto.title = data["title"] as? String ?? ""
                    self.homeDto.description = data["description"] as? String ?? ""
                    self.homeDto.imageUrl = data["imageUrl"] as? String ?? ""
                    self.homeDto.price = data["price"] as? String ?? ""
                    self.homeDto.size = data["size"] as? String ?? ""
                    self.homeDto.location = data["location"] as? String ?? ""
                    self.homeDto.latitude = data["latitude"] as? Double ?? 0.0
                    self.homeDto.longitude = data["longitude"] as? Double ?? 0.0
                    self.homeDto.phone = data["phone"] as? String ?? ""
                    self.homeDto.homeState = data["homeState"] as? String ?? ""
                    self.homeDto.userId = data["userId"] as? String ?? ""
                    self.homeDto.owner = data["owner"] as? String ?? ""
                    self.homeDto.publishTime = data["publishTime"] as? String ?? ""
                    self.homeDto.isPublished = data["isPublished"] as? Bool ?? true
                    self.homeDto.isFavorite = data["isFavorite"] as? Bool ?? false
                    
                    completionBlock(.success(self.homeDto))
                }
            }
        }
    }
}
