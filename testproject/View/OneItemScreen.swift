//
//  OneItemScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 06.02.2022.
//

import SwiftUI
import Kingfisher
struct OneItemScreen: View {
    @Binding var currentDish : Dishes?
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        screen = "MainScreen"
                    }
                } label: {
                    Text("<")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                Spacer()

            }
            .padding(.top,10)
            .padding(.leading,25)
            TabView {
                KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                    .resizable()
                    .frame(width: 240, height: 240)
                    .cornerRadius(120)
                KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                    .resizable()
                    .frame(width: 240, height: 240)
                    .cornerRadius(120)
                KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                    .resizable()
                    .frame(width: 240, height: 240)
                    .cornerRadius(120)
                KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                    .resizable()
                    .frame(width: 240, height: 240)
                    .cornerRadius(120)
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3.5)
            .tabViewStyle(PageTabViewStyle())
            VStack(spacing: 20) {
                Text("**\(currentDish?.nameDish ?? "")**")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,30)
                    .foregroundColor(.black)
                    .font(.system(size: 28))
                Text("N\(currentDish?.price ?? "")")
                    .foregroundColor(Color("MyOrange"))
                    .font(.system(size: 22))
            }
            .padding(.top,20)
            Spacer()
            VStack(spacing: 10) {
                HStack {
                    Text("Delivery info")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .padding(.leading,7)
                    Spacer()
                }
                HStack {
                    Text("Delivered between monday aug and thursday 20 from 8pm to 91:32 pm")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal,30)
            Spacer()
            VStack {
                Button {
                    
                } label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .frame(width: 320, height: 70)
                        .background(
                            Capsule()
                                .foregroundColor(Color("MyOrange"))
                        )
                }

            }
            Spacer()
        }
        
    }
}
//
//struct OneItemScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        OneItemScreen()
//    }
//}
