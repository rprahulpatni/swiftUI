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
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridVLayout) {
                        ForEach(viewModel.arrUsers, id: \.id) { userData in
                            NavigationLink(destination: {
                                ListViewDetails(userData: userData)
                            }, label: {
                                UsersView(usersData: userData)
                            })
                        }
                    }.padding(.all, 10)
                }
                .onAppear(perform: {
                    viewModel.fetchUsersList()
                })
//                .modifier(CustomLoaderModifier(isLoading: self.$listVM.isLoading))
            }.navigationBarTitle("USER'S LIST",displayMode: .inline)
        }
        .overlay{
            LoadingView(showProgress: $viewModel.isLoading)
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
