//
//  Search.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI

struct Search: View {
    @ObservedObject var searchVM: SearchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    List(searchVM.filteredPost, id: \.id) { posts in
                        Text(posts.title)
                    }.onAppear(perform: {
                        searchVM.getPostList()
                    })
                    //CustomProgressView(showProgressBar: searchVM.isShowProgress)
                }.navigationBarTitle("POST LIST", displayMode: .inline)
                    .searchable(text: $searchVM.searchText)
            }
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
