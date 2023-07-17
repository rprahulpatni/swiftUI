//
//  CustomLoaderModifier.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 17/07/23.
//

import SwiftUI

struct CustomLoaderModifier: ViewModifier {
    @Binding var isLoading: Bool
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                CustomProgressView(showProgressBar: isLoading)
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle())
//                    .scaleEffect(2)
//                    .foregroundColor(.white)
//                    .background(Color.black.opacity(0.4))
//                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
//struct CustomLoaderModifier_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomLoaderModifier(isLoading: .constant(false))
//    }
//}

extension View {
    func loader(isLoading: Binding<Bool>) -> some View {
        self.modifier(CustomLoaderModifier(isLoading: isLoading))
    }
}
