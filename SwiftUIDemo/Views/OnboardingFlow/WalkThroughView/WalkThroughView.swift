//
//  WalkThroughView.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 05/06/23.
//

import SwiftUI
import Firebase

var totalViews = 3

struct WalkThroughView: View {
    
    @AppStorage("currentView") var currentView = 1
    
    var body: some View {
        if currentView == 1 {
            WalkThrough(title: "20% Off For New Customers", description: "On Shopping Cart Cup Holders At Zooblie", bgColor: "PastelColor", img: "intro_1").transition(.opacity)
        } else if currentView == 2 {
            WalkThrough(title: "Save on No Cost EMI", description: "Avail No Cost EMI offers at Zooblie.in", bgColor: "VilvetColor", img: "intro_2").transition(.opacity)
        } else if currentView == 3 {
            WalkThrough(title: "Shopping Offers", description: "Online Shopping Offers on Zooblie, Grab upto 40 to 90% off", bgColor: "OrangeColor", img: "intro_3").transition(.opacity)
        }
        
        if currentView == 4 {
            OnboardingView()
        }
    }
}

struct WalkThroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughView()
    }
}
