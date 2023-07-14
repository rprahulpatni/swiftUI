//
//  ProductsModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

// MARK:
struct ProductsModel : Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    //let category: Category
    var image: String = "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg"
    let rating: Rating
}

enum Category {
    case electronics
    case jewelery
    case menSClothing
    case womenSClothing
}

// MARK: - Rating
struct Rating : Codable {
    let rate: Double
    let count: Int
}
