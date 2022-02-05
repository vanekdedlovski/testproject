//
//  OnBoardingScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI

struct OnBoardingScreen: View {
    @Binding var screen : String
    @EnvironmentObject var netWork : Network
    @EnvironmentObject var viewModule : ViewModule
    var body: some View {
        VStack {
            TabView {
                VStack {
                    Image("first")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    Text("Fastest Delivery 24/7")
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .font(.system(size: 50))
                }
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(
                    Color("MyOrange")
                )
                VStack {
                    Image("first2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                   
                    HStack {
                        Button {
                            withAnimation {
                                screen = "SignInScreen"
                            }
                        } label: {
                            Text("Sign ln")
                                .foregroundColor(.black)
                                .font(.custom("Italianno-Regular", size: 24))
                                .frame(width: 158, height: 70)
                                .background(
                                    Capsule()
                                        .foregroundColor(.white)
                                )
                        }
                        Button {
                            withAnimation {
                                screen = "SignUpScreen"
                            }
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.black)
                                .font(.custom("Italianno-Regular", size: 24))
                                .frame(width: 158, height: 70)
                                .background(
                                    Capsule()
                                        .foregroundColor(.white)
                                )
                        }
                    }
                    .padding(.top,50)
                   
                }
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(
                    Color("MyOrange")
                )
                
            }
            .padding(.bottom,30)
            .tabViewStyle(PageTabViewStyle())
            VStack {
                if (netWork.IsConnect == false) {
                    Button {
                        withAnimation {
                            screen = "MainScreen"
                        }
                    } label: {
                        Text("Skip Autorization")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.bottom,40)
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("MyOrange")
        )
        
        
    }
}

//struct OnBoardingScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingScreen()
//    }
//}
