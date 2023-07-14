//
//  WalkThrough.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI

struct WalkThrough: View {
    
    @AppStorage("currentView") var currentView = 1
    
    var title: String
    var description: String
    var bgColor: String
    var img: String
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Greetings!!")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        currentView = 4
                    }, label: {
                        Text("Skip")
                            .foregroundColor(.white)
                    })
                }.padding()
                Spacer()
                VStack(alignment: .leading) {
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text(description)
                        .foregroundColor(.white)
                        .padding(.top, 5.0)
                    Spacer(minLength: 0)
                }.padding()
                    .overlay(
                        HStack{
                            if currentView == 1 {
                                ContainerRelativeShape()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.white.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            if currentView == 2 {
                                ContainerRelativeShape()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.white.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            if currentView == 3 {
                                ContainerRelativeShape()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.white.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            
                            Spacer()
                            Button(action: {
                                withAnimation(.easeOut){
                                    if currentView <= totalViews || currentView == 2 {
                                        currentView += 1
                                    } else if currentView == 3 {
                                        currentView = 1
                                    }
                                }
                            }, label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35.0, weight: .semibold))
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .padding(20)
                                    .overlay(
                                        ZStack{
                                            Circle()
                                                .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                                .padding()
                                                .foregroundColor(.white)
                                        }
                                    )
                            })
                        }.padding(), alignment: .bottomTrailing
                    )
            }
        }.background(
            LinearGradient(colors: [Color(bgColor), Color("BgNextBtn")], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct WalkThrough_Previews: PreviewProvider {
    static var previews: some View {
        WalkThrough(title: "Test", description: "Testing new task with multiple tabs", bgColor: "PastelColor", img: "intro_1")
    }
}
