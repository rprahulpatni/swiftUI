//
//  OnboardingView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var sessionManager : SessionManager
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                VStack{
                    NavigationLink(destination: LoginView(viewModel: LoginViewModel(iSessionManager: sessionManager)), label: {
                        Text("Login")
                    }).buttonStyle(CustomBtn())
                    NavigationLink(destination: SignUpView(viewModel: SignUpViewModel(iSessionManager: sessionManager)), label: {
                        Text("SignUP")
                    }).buttonStyle(CustomBtn())
                }.padding(10)
            }.padding(10)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
