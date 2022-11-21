//
//  HomeDto.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

struct HomeDto: Codable {
    var homeId: String?
    var title: String?
    var description: String?
    var imageUrl: String?
    var price: String?
    var size: String?
    var location: String?
    var latitude: Double?
    var longitude: Double?
    var phone: String?
    var homeState: String?
    var userId: String?
    var owner: String?
    var publishTime: String?
    var isPublished: Bool?
    var isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case homeId
        case title
        case description
        case imageUrl
        case price
        case size
        case location
        case latitude
        case longitude
        case phone
        case homeState
        case userId
        case owner
        case publishTime
        case isPublished
        case isFavorite
    }
    
    init() { }
    
    init(
        homeId: String?,
        title: String?,
        description: String?,
        imageUrl: String?,
        price: String?,
        size: String?,
        location: String?,
        latitude: Double?,
        longitude: Double?,
        phone: String?,
        homeState: String?,
        userId: String?,
        owner: String?,
        publishTime: String?,
        isPublished: Bool?,
        isFavorite: Bool?
    ) {
        self.homeId = homeId
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
        self.size = size
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.phone = phone
        self.homeState = homeState
        self.userId = userId
        self.owner = owner
        self.publishTime = publishTime
        self.isPublished = isPublished
        self.isFavorite = isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.homeId = try container.decode(String.self, forKey: .homeId)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.price = try container.decode(String.self, forKey: .price)
        self.size = try container.decode(String.self, forKey: .size)
        self.location = try container.decode(String.self, forKey: .location)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.homeState = try container.decode(String.self, forKey: .homeState)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.owner = try container.decode(String.self, forKey: .owner)
        self.publishTime = try container.decode(String.self, forKey: .publishTime)
        self.isPublished = try container.decode(Bool.self, forKey: .isPublished)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(homeId, forKey: .homeId)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(price, forKey: .price)
        try container.encode(size, forKey: .size)
        try container.encode(location, forKey: .location)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(phone, forKey: .phone)
        try container.encode(homeState, forKey: .homeState)
        try container.encode(userId, forKey: .userId)
        try container.encode(owner, forKey: .owner)
        try container.encode(publishTime, forKey: .publishTime)
        try container.encode(isPublished, forKey: .isPublished)
        try container.encode(isFavorite, forKey: .isFavorite)
    }
    
    func toModel() -> Home {
        return Home(
            homeId: self.homeId.valueOrEmpty,
            title: self.title.valueOrEmpty,
            description: self.description.valueOrEmpty,
            image: self.imageUrl.valueOrEmpty,
            price: self.price.valueOrEmpty,
            size: self.size.valueOrEmpty,
            location: self.location.valueOrEmpty,
            latitude: self.latitude.valueOrZero,
            longitude: self.longitude.valueOrZero,
            phone: self.phone.valueOrEmpty,
            state: self.homeState,
            isFavorite: self.isFavorite.valueOrFalse,
            userId: User(id: self.userId),
            owner: User(id: self.userId),
            isPublished: self.isPublished.valueOrFalse,
            publishTime: self.publishTime.valueOrEmpty
        )
    }
}
