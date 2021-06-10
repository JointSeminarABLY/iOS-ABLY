//
//  OnepieceModel.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/06/11.
//

import Foundation

// MARK: - OnepieceModel
struct OnepieceModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Onepiece?
    
    enum CodingKeys: String, CodingKey {
        case status
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .success)) ?? 400
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(Onepiece.self, forKey: .data)) ?? nil
    }
}

// MARK: - Onepiece
struct Onepiece: Codable {
    let id, name: String
    let image: String
    let discount, price: Int
    let shop: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image, discount, price, shop
    }
}
