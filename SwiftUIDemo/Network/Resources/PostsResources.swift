//
//  PostsResources.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

struct PostsResources {
    func getPostsList(completion: @escaping(Result<[PostsModel]>) -> Void) {
        APIHelper.shared.callAPI(urlString: URLEndpoint.getPostList, method: .get, completion: completion)
    }
}
