//
//  ContentView.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModule = ViewModule()
    @StateObject var netWork = Network()
    @State var currentDish : Dishes?
    @State var screen = "LauchScreen"
    @State var cart : [Dishes] = []
    @State var OverlayActive = "home"
    @State var FullPrice = 0 
    var body: some View {
        if (screen == "LauchScreen") {
            LauchScreen(screen: $screen)
                .environmentObject(viewModule)
                .environmentObject(netWork)
        }
        if (screen == "OnBoardingScreen") {
            OnBoardingScreen(screen: $screen)
                .environmentObject(viewModule)
                .environmentObject(netWork)
        } else if (screen == "SignInScreen") {
            SignInScreen(screen: $screen)
                .environmentObject(viewModule)
                .environmentObject(netWork)
        } else if (screen == "SignUpScreen") {
            SignUpScreen(screen: $screen)
                .environmentObject(netWork)
                .environmentObject(viewModule)
        } else if (screen == "MainScreen") {
            MainScreen(screen: $screen, currentDish: $currentDish, OverlayActive: $OverlayActive, cart: $cart)
                .environmentObject(viewModule)
        }
        else if (screen == "OneitemScreen") {
            OneItemScreen(currentDish: $currentDish, screen: $screen)
                .environmentObject(viewModule)
        }
        else if (screen == "HistoryScreen") {
            HistoryScreen(screen: $screen, currentDish: $currentDish, OverlayActive: $OverlayActive, cart: $cart)
                .environmentObject(viewModule)
        }
        else if (screen == "OrderScreen") {
            OrderScreen(screen: $screen, currentDish: $currentDish, OverlayActive: $OverlayActive, cart: $cart, FullPrice: $FullPrice)
                .environmentObject(viewModule)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
