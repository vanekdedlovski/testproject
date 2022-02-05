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
    @State var screen = "LauchScreen"
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
            MainScreen(screen: $screen)
                .environmentObject(viewModule)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
