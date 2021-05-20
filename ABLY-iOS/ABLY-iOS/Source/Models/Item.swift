//
//  Item.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/18.
//

import Foundation

struct Item {
    let image: String
    let discount: Int?
    let price: String
    let store: String
    let item: String
    let review: Int?
    let satisfaction: Int?
    
    init(image: String,
         discount: Int? = 0,
         price: String,
         store: String,
         item: String,
         review: Int? = 0,
         satisfaction: Int? = 0) {
        self.image = image
        self.discount = discount
        self.price = price
        self.store = store
        self.item = item
        self.review = review
        self.satisfaction = satisfaction
    }
}
