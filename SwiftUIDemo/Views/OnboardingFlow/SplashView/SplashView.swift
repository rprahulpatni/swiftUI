//
//  SplashView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var sessionManager : SessionManager
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            if isPresented {
                if sessionManager.loggedUser != nil {
                    ContentView()
                } else {
                    WalkThroughView()
                }
            } else {
                VStack{
                    Image("logo")
                }.padding(.all, 10)
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation{
                    self.isPresented = true
                }
            }
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
