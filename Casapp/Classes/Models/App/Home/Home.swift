//
//  Home.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

struct Home {
    var homeId: String = ""
    var title: String? = ""
    var description: String? = ""
    var image: String? = "https://www.publico.es/files/module_big_mobile//files/crop//uploads/2020/08/03/5f282dfd15c4f.r_1597232935966.0-0-692-388.jpeg"
    var price: String? = ""
    var size: String? = ""
    var location: String? = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var phone: String? = ""
    var state: String? = ""
    var isFavorite: Bool? = false
    var userId: User? = User()
    var owner: User? = User()
    var isPublished: Bool? = false
    var publishTime: String? = ""
}
