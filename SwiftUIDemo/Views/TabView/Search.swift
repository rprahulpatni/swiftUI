//
//  Search.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Search: View {
    //    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    var arrVideoList : [VideoModel] = BundleDecoderFromJson.decodeVideoListFromBundleToJson()
    
    var body: some View {
        //        NavigationStack {
        //                VStack {
        //                    List(viewModel.filteredPost, id: \.id) { products in
        //                        ProductsListCell(products: products)
        //                            .background(.clear)
        //                    }.padding(.all, -10)
        //                }.listStyle(.plain)
        //                    .onAppear(perform: {
        //                        viewModel.getProductsList()
        //                    })
        ////                    .modifier(CustomLoaderModifier(isLoading: self.$viewModel.isLoading))
        //                    .navigationBarTitle("PRODUCTS", displayMode: .inline)
        //                    .searchable(text: $viewModel.searchText)
        //        }
        //        .overlay{
        //            LoadingView(showProgress: $viewModel.isLoading)
        //        }
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
        
        NavigationStack{
            List{
                ForEach(arrVideoList, id: \.self) { videoData in
                    //For hiding next arrow
                    ZStack {
                        VideoView(videoData: videoData)
                        NavigationLink(destination: SearchViewDetails(videoData: videoData)) {
                            EmptyView()
                        }
                        .opacity(0)
                    }.padding(.all, -5)
                }
                .listRowSeparator(.hidden,edges: .all)
                .listRowBackground(Color.clear)
            }.padding(.all, -5)
                .listStyle(.plain)
                .navigationBarTitle("VIDEO LIST",displayMode: .inline)
        }
    }
    
    @ViewBuilder
    func VideoView(videoData: VideoModel) -> some View {
        HStack(alignment: .center){
            HStack(){
                let imgUrl = URL(string: videoData.thumb ?? "")
                WebImage(url: imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(5)
                VStack(alignment: .leading, spacing: 10){
                    Text(videoData.title ?? "")
                        .font(.headline)
                        .lineLimit(2)
                    Text(videoData.description ?? "")
                        .font(.caption)
                        .lineLimit(2)
                }
            }.padding(.all, 15)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .listRowSeparator(.hidden)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
