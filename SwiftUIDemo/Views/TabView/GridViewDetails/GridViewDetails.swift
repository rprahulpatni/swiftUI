//
//  GridViewDetails.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import SwiftUI

struct GridViewDetails: View {
    var landmark: Landmark
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                CustomMapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text(landmark.name).font(.title)
                    }
                    
                    HStack{
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    } .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
                .toolbar(.hidden, for: .tabBar)
            }
            .navigationBarTitle(landmark.name, displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
        }
    }
}

struct GridViewDetails_Previews: PreviewProvider {
    static let modelData = LocalDataHelper()
    
    static var previews: some View {
        GridViewDetails(landmark: modelData.landmarks[0])
    }
}
