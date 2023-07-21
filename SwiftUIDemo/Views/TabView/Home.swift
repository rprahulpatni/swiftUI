//
//  Home.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI
import Firebase

struct Home: View {
    @ObservedObject var viewModel : HomeViewModel = HomeViewModel()
    
    @State private var gridVLayout : [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridVLayout) {
                    ForEach(viewModel.arrUsers, id: \.id) { userData in
                        NavigationLink(destination: {
                            HomeViewDetails(userData: userData)
                        }, label: {
                            UsersListView(usersData: userData)
                        })
                        if userData.id == viewModel.arrUsers.last?.id {
                            if viewModel.skip < viewModel.totalPages {
                                ProgressView(label: {
                                    Text("Loading")
                                }).progressViewStyle(.circular)
                                    .tint(.red)
                                    .onAppear(perform: {
                                        viewModel.getUsersList(false)
                                    })
                            }
                        }
                    }
                }.padding(.all, 10)
            }.onAppear(perform: {
                viewModel.getUsersList(true)
            })
            .navigationBarTitle("HOME",displayMode: .inline)
            //.modifier(CustomLoaderModifier(isLoading: self.$viewModel.isLoading))
        }.overlay{
            LoadingView(showProgress: $viewModel.isLoading)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
