//
//  ProductsResources.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

struct ProductsResources {
        
    func getProductList(completion: @escaping (Result<[ProductsModel]>) -> Void) {

        APIHelper.shared.callAPI(for: [ProductsModel].self,
                                 urlString: URLEndpoint.getProductsList,
                                  method: .get,
                                  completion: completion)
//        APIHelper.shared.callAPI(for: [ProductsModel].self, urlString: URLEndpoint.getProductsList, method: .get, completion: { result in
//            switch result {
//            case .success(let products):
//                print(products)
//                // update the UI with the user details
//            case .failure(let err):
//                print(err.localizedDescription)
//                // inform about the error
//            }
//        })
    }
}
