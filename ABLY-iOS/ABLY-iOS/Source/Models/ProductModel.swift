//
//  ProductModel.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/06/11.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {
    let success: Bool
    let message: String
    let data: DataClass
    let staus: Int
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
        case staus
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        staus = (try? values.decode(Int.self, forKey: .staus)) ?? 400
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(DataClass.self, forKey: .data)) ?? DataClass(product: [])
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let product: [Product]

    enum CodingKeys: String, CodingKey {
        case product = "Product"
    }
}

// MARK: - Product
struct Product: Codable {
    let id, name: String
    let image: String
    let discount, price: Int
    let shop: String
    let reviewCount, satisfy: Int
    let category, date: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image, discount, price, shop
        case reviewCount = "review_count"
        case satisfy, category, date
        case v = "__v"
    }
}
