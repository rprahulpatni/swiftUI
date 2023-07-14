//
//  Grid.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 06/06/23.
//

import SwiftUI

struct GridView: View {
    
    @ObservedObject var modelData : LocalDataHelper = LocalDataHelper()
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .clipped()
                        //.listRowInsets(EdgeInsets())
                    
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                }.listStyle(.plain)
            }.navigationBarTitle("LANDMARKS", displayMode: .inline)
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
