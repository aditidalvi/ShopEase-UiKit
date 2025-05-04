//
//  Product.swift
//  ShopEase-Uikit
//
//  Created by Aditi Dalvi on 04/05/25.
//

struct ProductModel: Codable {
    let category: String
    let image: String
    let title: String
    let price: Double
}

struct ProductData: Codable {
    let image: String
    let title: String
    let price: Double
}

struct ProductVM {
    let category: String
    let products: [ProductData]
    init(category: String, products: [ProductData]) {
        self.category = category
        self.products = products
    }
}

