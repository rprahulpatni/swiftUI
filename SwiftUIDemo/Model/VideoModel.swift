//
//  VideoModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 02/08/23.
//

import Foundation

struct VideoModel: Hashable, Codable {
    var description: String?
    var sources: String
    var subtitle: String?
    var thumb: String?
    var title: String?
}
