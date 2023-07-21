//
//  Search.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI

struct Search: View {
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
                VStack {
                    List(viewModel.filteredPost, id: \.id) { products in
                        ProductsListCell(products: products)
                            .background(.clear)
                    }.padding(.all, -10)
                }.listStyle(.plain)
                    .onAppear(perform: {
                        viewModel.getProductsList()
                    })
//                    .modifier(CustomLoaderModifier(isLoading: self.$viewModel.isLoading))
                    .navigationBarTitle("PRODUCTS", displayMode: .inline)
                    .searchable(text: $viewModel.searchText)
        }
        .overlay{
            LoadingView(showProgress: $viewModel.isLoading)
        }
        //        NavigationStack{
        //            ZStack {
        //                VStack{
        //                    List(searchVM.filteredPost, id: \.id) { posts in
        //                        Text(posts.title)
        //                    }.onAppear(perform: {
        //                        searchVM.getPostList()
        //                    })
        //                    //CustomProgressView(showProgressBar: searchVM.isShowProgress)
        //                }.navigationBarTitle("POST LIST", displayMode: .inline)
        //                    .searchable(text: $searchVM.searchText)
        //            }
        //        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
