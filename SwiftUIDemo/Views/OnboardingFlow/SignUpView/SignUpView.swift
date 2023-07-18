//
//  SignUpView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseStorage

struct CountryList: Hashable, Codable {
    //    var id = UUID()
    var name: String?
    var code: String?
    var dial_code: String?
    var flag: String?
}

struct SignUpView: View {
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return min...max
    }
    
    @State private var selectedItem: PhotosPickerItem? = nil
//    @State private var selectedImageData: Data? = nil
    
    @State private var isPickerVisible = false
    @State private var isMenuOpen = false
    @StateObject private var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        if let imgData = self.viewModel.selectedImageData, let uiImage = UIImage(data: imgData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 5)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 5)
                        }
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                Image(systemName: "camera")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .font(.system(size: 20))
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .offset(x: 60)
                                    .padding(.top, 120)
                            }.padding(.bottom, 20)
                            .onChange(of: selectedItem) { newItem in
                                Task {
                                    // Retrieve selected asset in the form of Data
                                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                        self.viewModel.selectedImageData = data
                                        if let imgData = self.viewModel.selectedImageData, let uiImage = UIImage(data: imgData) {
                                            self.viewModel.selectedImage = uiImage
                                        }
                                    }
                                }
                            }
                    }
                    TextField("Name", text: $viewModel.userName)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(CustomTxtFieldStyle())
                        .padding(.bottom, 5)
                    TextField("Email", text: $viewModel.userEmail)
                        .textFieldStyle(CustomTxtFieldStyle())
                        .keyboardType(.emailAddress)
                        .padding(.bottom, 5)
                    HStack{
                        TextField("+91", text: $viewModel.userCountryCode)
                            .textFieldStyle(CustomTxtFieldStyle())
                            .frame(width: 70)
                            .onTapGesture {
                                isPickerVisible = true
                                hideKeyboard()
                            }
                            .onDisappear {
                                hideKeyboard()
                            }
                            .sheet(isPresented: $isPickerVisible) {
                                CustomCountryPickerView(selectedCountryCode: $viewModel.userCountryCode, isCountryPickerVisible: $isPickerVisible)
                            }
                        TextField("Mobile Number", text: $viewModel.userMobile)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTxtFieldStyle())
                    }
                    .padding(.bottom, 5)
                    DatePicker("Select DOB", selection: $viewModel.selectedDOB, in: dateClosedRange, displayedComponents: .date)
                        .padding(.all, 10)
                        .background(CustomGraditantView())
                        .padding(.bottom, 5)
                    TextField("Gender", text: $viewModel.userGender)
                        .textFieldStyle(CustomTxtFieldStyle())
                        .padding(.bottom, 5)
                        .contextMenu {
                            Menu {
                                Button(action: {
                                    self.isMenuOpen = false
                                    self.viewModel.userGender = "Male"
                                }) {
                                    Label("Male", systemImage: "person")
                                }
                                Button(action: {
                                    self.isMenuOpen = false
                                    self.viewModel.userGender = "Female"
                                }) {
                                    Label("Female", systemImage: "person.fill")
                                }
                                Button(action: {
                                    self.isMenuOpen = false
                                    self.viewModel.userGender = "Other"
                                }) {
                                    Label("Other", systemImage: "person.3")
                                }
                            } label: {
                                Label("Select Gender", systemImage: "arrowtriangle.down.fill")
                            }
                        }
                        .onTapGesture {
                            hideKeyboard()
                        }
                    SecureField("Password", text: $viewModel.userPassword)
                        .textFieldStyle(CustomTxtFieldStyle())
                        .padding(.bottom, 5)
                    SecureField("Confirm Password", text: $viewModel.userConfirmPassword)
                        .textFieldStyle(CustomTxtFieldStyle())
                        .padding(.bottom)
                    Button(action: {
                        viewModel.signUp()
                    }, label: {
                        Text("Sign UP")
                    }).buttonStyle(CustomBtn())
                        .alert(isPresented: $viewModel.showAlert) {
                            if  viewModel.isLoggedIn {
                                return Alert(title: Text("Alert"), message: Text("Registration Successfull !!"), dismissButton: .default(Text("OK")) {
                                    self.viewModel.sessionManager?.loggedUser = self.viewModel.loggedInUser
                                })
                            } else  {
                                return Alert(title: Text("Alert"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")) {
                                })
                            }
                        }
                }
                .padding()
                .navigationBarTitle("SIGNUP", displayMode: .inline)
                .navigationBarBackButtonHidden()
                .navigationBarItems(leading: CustomBackButton())
            }
            .modifier(CustomLoaderModifier(isLoading: $viewModel.isLoading))
            .modifier(CustomHideKeyboardModifier())
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(iSessionManager: nil))
    }
}
