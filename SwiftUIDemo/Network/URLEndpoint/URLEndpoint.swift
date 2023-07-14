//
//  URLEndpoint.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

struct URLEndpoint {
    static let getPostList = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    static let getProductsList = URL(string: "https://fakestoreapi.com/products")!
    static let getAnimal : URL = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!
//    static let getUsersList : URL = URL(string: "https://dummyjson.com/users?limit=2&skip=10")!
    static let getUsersList : String =  "https://dummyjson.com/users?limit="
}
