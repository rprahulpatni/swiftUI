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

struct LoadingView: View {
    @Binding var showProgress: Bool
    var body: some View {
        ZStack{
            if showProgress {
                Group{
                    Rectangle()
                        .fill(.black.opacity(0.25))
                        .ignoresSafeArea()
                    ProgressView()
                        .padding(15)
                        .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: showProgress)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(showProgress: .constant(false))
    }
}
