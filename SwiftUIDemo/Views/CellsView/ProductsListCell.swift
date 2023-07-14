//
//  ProductsListCell.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductsListCell: View {
    
    var products: ProductsModel
    
    var body: some View {
        HStack(alignment: .center){
            let imgUrl = URL(string: products.image)
            WebImage(url: imgUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .cornerRadius(25)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
                .padding(5)
            Text(products.title)
                .font(.title2)
                .lineLimit(2)
        }
            .listRowSeparator(.hidden)
            //.listRowBackground(RectangleShadowView())
    }
}

struct ProductsListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListCell(products:  ProductsModel(id: 0, title: "Test", price: 1.0, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", rating: Rating(rate: 4.0, count: 5)))
    }
}
