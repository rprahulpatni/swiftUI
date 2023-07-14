//
//  List.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var homeVM : ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(homeVM.arrProducts, id: \.id) { products in
                    ProductsListCell(products: products)
                }
            }.listStyle(.plain)
                .onAppear(perform: {
                    homeVM.getProductsList()
                })
                .navigationBarTitle("PRODUCTS", displayMode: .inline)
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
