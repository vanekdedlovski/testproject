//
//  SignInScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI

struct SignInScreen: View {
    
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
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                ,alignment: .top
            )
            Spacer()
            VStack {
                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        Spacer()
                    }
                    TextField("", text: $viewModule.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .background(
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 1)
                                .foregroundColor(.black)
                            ,
                            alignment: .bottom
                        )
                }
                .padding(.bottom,20)
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
                        Button {
                            
                        } label: {
                            Text("Forgot password?")
                                .font(.system(size: 17))
                                .foregroundColor(Color("MyOrange"))
                        }
                        Spacer()
                    }

                }
                Spacer()
                VStack {
                    Button {
                        viewModule.LoginLn {
                            withAnimation {
                                screen = "MainScreen"
                            }
                        } error: {
                            alert = true
                        }

                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 320, height: 74)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                            )
                    }
                    Button {
                        screen = "MainScreen"
                    } label: {
                        Text("123432")
                    }

                }
                Spacer()
                
            }
            .alert(viewModule.error1, isPresented: $alert, actions: {
                
            })
            .padding(.top,30)
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            Color("Silver")
        )
        
    }
}

//struct SignInScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInScreen()
//    }
//}
