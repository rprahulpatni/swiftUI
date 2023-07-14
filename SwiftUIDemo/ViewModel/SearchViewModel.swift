//
//  SearchViewModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    private let resources: PostsResources = PostsResources()
    @Published var arrPost: Array<PostsModel> = Array<PostsModel>()
    @Published var searchText: String = ""
    @Published var isShowProgress: Bool = false

    var filteredPost : [PostsModel] {
        guard !searchText.isEmpty else { return arrPost }
        return arrPost.filter({ post in
            post.title.lowercased().contains(searchText.lowercased())
        })
    }
    
    func getPostList() {
        self.isShowProgress = true
        resources.getPostsList() { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.arrPost.append(contentsOf: posts)
                    self.isShowProgress = false
                }
            case .failure(let err):
                print(err.localizedDescription)
                self.isShowProgress = false
            }
        }
    }
}
