//
//  SignUpScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI

struct SignUpScreen: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    @State var alert = false
    var body: some View {
        VStack {
            VStack {
                Image("cooking1")
                    .resizable()
                    .frame(width: 155, height: 155)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                ,alignment: .top
            )
            Spacer()
            VStack( spacing: 25) {
                Spacer()
                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        Spacer()
                    }
                    TextField("", text: $viewModule.email)
                        .background(
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                                .foregroundColor(.black)
                            ,
                            alignment: .bottom
                        )
                }
                Spacer()
                VStack {
                    HStack {
                        Text("Password")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        Spacer()
                    }
                    SecureField("", text: $viewModule.password)
                        .background(
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                                .foregroundColor(.black)
                            ,
                            alignment: .bottom
                        )
                }
                Spacer()
                VStack {
                    HStack {
                        Text("Full name")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        Spacer()
                    }
                    TextField("", text: $viewModule.firstName)
                        .background(
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                                .foregroundColor(.black)
                            ,
                            alignment: .bottom
                        )
                }
                VStack {
                    HStack {
                        Text("Phone number")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        Spacer()
                    }
                    TextField("", text: $viewModule.phone)
                        .background(
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                                .foregroundColor(.black)
                            ,
                            alignment: .bottom
                        )
                }
                VStack {
                    Button {
                        viewModule.RegisterLn {
                            withAnimation {
                                screen = "MainScreen"
                            }
                        } error: {
                            alert = true
                        }

                    } label: {
                        Text("Register Now")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 74)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                            )
                    }

                }
                VStack {
                    Button {
                        withAnimation {
                            screen = "OnBoardingScreen"
                        }
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 30,height: 74)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                            )
                    }

                }
                Spacer()
            }
            .padding(.top,30)
            .frame(width: UIScreen.main.bounds.width - 30)
        }
        .alert(viewModule.error1, isPresented: $alert, actions: {
            
        })
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("Silver")
        )
       
    }
}

//struct SignUpScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpScreen()
//    }
//}
