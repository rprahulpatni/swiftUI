//
//  CustomProgressView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 08/06/23.
//

import SwiftUI

struct CustomProgressView: View {
    @State var showProgressBar: Bool
    
    var body: some View {
        if showProgressBar {
            ProgressView(label: {
                Text("Loading...").font(.headline)
            })
            .progressViewStyle(.circular)
            .tint(.red)
//            .scaleEffect(2)
        }
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(showProgressBar: false)
    }
}
