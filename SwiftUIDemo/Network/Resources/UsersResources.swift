//
//  UsersResources.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 08/06/23.
//

import Foundation

struct UsersResources {
    func getUsersList(_ limit: Int, _ skip: Int, completion: @escaping(Result<UsersModel?>) -> Void) {
        let strUrl = "\(URLEndpoint.getUsersList)\(limit)&skip=\(skip)"
        APIHelper.shared.callAPI(urlString: URL(string: strUrl)!, method: .get, completion: completion)
    }
}
