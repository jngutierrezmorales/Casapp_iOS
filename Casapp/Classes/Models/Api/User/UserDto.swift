//
//  UserDto.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

struct UserDto: Codable {
    var userId: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case email
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(email, forKey: .email)
    }
}
