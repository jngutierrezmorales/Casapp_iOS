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
    @Published var homes = [HomeDto]()
    
    func loadHomes() {
        print("aaaa")
        
        database.collection("homes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.homes = documents.map { queryDocumentSnapshot -> HomeDto in
                let data = queryDocumentSnapshot.data()
                let homeId = data["homeId"] as? String ?? ""
                
                return HomeDto()
            }
        }
    }
}
