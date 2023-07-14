//
//  PostsModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

struct PostsModel : Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
