//
//  List.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel : ListViewModel = ListViewModel()
    @State private var gridVLayout : [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.arrUsers, id: \.id) { userData in
                    //For hiding next arrow
                    ZStack {
                        UsersView(usersData: userData)
                        NavigationLink(destination: ListViewDetails(userData: userData)) {
                            EmptyView()
                        }
                        .opacity(0)
                    }.padding(.all, -5)
                }
                .listRowSeparator(.hidden,edges: .all)
                .listRowBackground(Color.clear)
            }.padding(.all, -5)
                .listStyle(.plain)
                .navigationBarTitle("USER'S LIST",displayMode: .inline)
                .onAppear(perform: {
                    viewModel.fetchUsersList()
                })
        }.overlay{
            LoadingView(showProgress: $viewModel.isLoading)
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
