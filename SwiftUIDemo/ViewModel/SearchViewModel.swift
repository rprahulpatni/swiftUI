//
//  SearchViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

class SearchViewModel: ObservableObject {
//    private let resources: PostsResources = PostsResources()
//    @Published var arrPost: Array<PostsModel> = Array<PostsModel>()
    private let resources: ProductsResources = ProductsResources()
    @Published var arrProducts : Array<ProductsModel> = Array<ProductsModel>()

    @Published var searchText: String = ""
    @Published var isLoading: Bool = false

    var filteredPost : [ProductsModel] {
        guard !searchText.isEmpty else { return arrProducts }
        return arrProducts.filter({ post in
            post.title.lowercased().contains(searchText.lowercased())
        })
    }
    
//    func getPostList() {
//        self.isShowProgress = true
//        resources.getPostsList() { result in
//            switch result {
//            case .success(let posts):
//                DispatchQueue.main.async {
//                    self.arrPost.append(contentsOf: posts)
//                    self.isShowProgress = false
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//                self.isShowProgress = false
//            }
//        }
//    }
    
    func getProductsList() {
        self.isLoading = true
        self.arrProducts.removeAll()
        resources.getProductList() { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    print(products)
                    self.arrProducts.append(contentsOf: products)
                    self.isLoading = false
                }
            case .failure(let err):
                print(err.localizedDescription)
                // inform about the error
                self.isLoading = false
            }
        }
    }
}
