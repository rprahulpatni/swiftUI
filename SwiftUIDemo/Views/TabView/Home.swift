//
//  Home.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI
import Firebase

struct Home: View {
    @ObservedObject var homeVM : HomeViewModel = HomeViewModel()
    
    @State private var gridVLayout : [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridVLayout) {
                        ForEach(homeVM.arrUsers, id: \.id) { userData in
                            NavigationLink(destination: {
                                HomeViewDetails(userData: userData)
                            }, label: {
                                UsersListView(usersData: userData)
                            })
                            if userData.id == homeVM.arrUsers.last?.id {
                                if homeVM.skip < homeVM.totalPages {
                                    ProgressView(label: {
                                        Text("Loading")
                                    }).progressViewStyle(.circular)
                                        .tint(.red)
                                        .onAppear(perform: {
                                            homeVM.getUsersList()
                                        })
                                }
                            }
                        }
                    }.padding(.all, 10)
                }.onAppear(perform: {
                    homeVM.getUsersList()
                })
            }.navigationBarTitle("HOME",displayMode: .inline)
        }
    }
    
    func action_Logout(){
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
