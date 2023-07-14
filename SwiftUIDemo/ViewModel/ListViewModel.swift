//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

class ListViewModel: ObservableObject {
    private let resources: ProductsResources = ProductsResources()
    @Published var arrProducts : Array<ProductsModel> = Array<ProductsModel>()
    
    func getProductsList() {
        resources.getProductList() { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.arrProducts.append(contentsOf: products)
                }
            case .failure(let err):
                print(err.localizedDescription)
                // inform about the error
            }
        }
    }
}
