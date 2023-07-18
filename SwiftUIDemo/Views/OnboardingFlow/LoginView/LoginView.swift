//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
//    @State private var shouldNavigate : Bool = false
    @StateObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            NavigationStack{
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer()
                    VStack() {
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(CustomTxtFieldStyle())
                            .padding(.bottom, 5)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(CustomTxtFieldStyle())
                            .padding(.bottom)
                        Button(action: {
                            viewModel.login()
                        }, label: {
                            Text("Sign In")
                        }).buttonStyle(CustomBtn())
                            .alert(isPresented: $viewModel.showAlert) {
                                if  viewModel.isLoggedIn {
                                    return Alert(title: Text("Alert"), message: Text("Logged In Successfull !!"), dismissButton: .default(Text("OK")) {
                                        self.viewModel.sessionManager?.loggedUser = self.viewModel.loggedInUser
                                    })
                                } else  {
                                    return Alert(title: Text("Alert"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")) {
                                    })
                                }
                            }
                    }
                    .padding()
                    .navigationBarTitle("LOGIN", displayMode: .inline)
                    .navigationBarBackButtonHidden()
                    .navigationBarItems(leading: CustomBackButton())
                }
            }
            .modifier(CustomLoaderModifier(isLoading: $viewModel.isLoading))
            .modifier(CustomHideKeyboardModifier())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(iSessionManager: nil))
    }
}
