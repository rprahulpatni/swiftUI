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
        VStack(alignment: .center){
            VStack(){
                let imgUrl = URL(string: products.image)
                WebImage(url: imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200, alignment: .center)
                    .padding(5)
                VStack(alignment: .leading, spacing: 10){
                    HStack(alignment: .center){
                        Text("Price : $ " + String(format: "%0.1f", products.price))
                            .font(.headline)
                            .lineLimit(2)
                        Spacer()
                        CustomRatingView(rating: products.rating.rate)
                    }
                    Text(products.title)
                        .font(.headline)
                        .lineLimit(2)
                    Text(products.description)
                        .font(.caption)
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

struct ProductsListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListCell(products:  ProductsModel(id: 0, title: "Test", price: 1.0, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", rating: Rating(rate: 4.0, count: 5)))
    }
}
