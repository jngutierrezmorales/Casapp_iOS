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
    
    func fetchHomes(completionBlock: @escaping(Result<[HomeDto], Error>) -> Void) {
        //homes.removeAll()
        
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
}
