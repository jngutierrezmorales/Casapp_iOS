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
    
    init() {
        homeId = nil
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.homeId = try container.decode(String.self, forKey: .homeId)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
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
}
