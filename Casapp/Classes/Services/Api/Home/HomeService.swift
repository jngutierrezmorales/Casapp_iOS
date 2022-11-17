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
    @Published private var homes = [HomeDto]()
    
    func loadHomes() -> [HomeDto] {
        database.collection("homes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("loadHomes service error")
                return
            }

            self.homes = documents.map { queryDocumentSnapshot -> HomeDto in
                let data = queryDocumentSnapshot.data()
                let homeId = data["homeId"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
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

                return HomeDto(
                    homeId: homeId,
                    title: title,
                    description: description,
                    imageUrl: imageUrl,
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
            }
        }
        
        return homes.map { home in
            HomeDto(
                homeId: home.homeId,
                title: home.title,
                description: home.description,
                imageUrl: home.imageUrl,
                size: home.size,
                location: home.location,
                latitude: home.latitude,
                longitude: home.longitude,
                phone: home.phone,
                homeState: home.homeState,
                userId: home.userId,
                owner: home.owner,
                publishTime: home.publishTime,
                isPublished: home.isPublished,
                isFavorite: home.isFavorite
            )
        }
    }
}
