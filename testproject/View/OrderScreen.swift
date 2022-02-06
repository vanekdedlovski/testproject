//
//  OrderScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 06.02.2022.
//

import SwiftUI
import Kingfisher

struct OrderScreen: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    @Binding var currentDish : Dishes?
    @Binding var OverlayActive : String
    @Binding var cart : [Dishes]
    @Binding var FullPrice : Int
    var body: some View {
        VStack {
            HStack {
                Text("Order")
                    .foregroundColor(.black)
                    .font(.custom("Italianno-Regular", size: 48))
                Spacer()
                Text("4th Avenue, 76")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                Spacer()
                Button {
                    
                } label: {
                    Image("location")
                    
                }

            }
            .padding(.horizontal,30)
            VStack {
                ScrollView(.vertical) {
                    ForEach(cart, id:\.dishId) {dish in
                        HStack {
                            VStack {
                                KFImage(URL(string: "http://food.madskill.ru/up/images/\(dish.icon ?? "")"))
                                    .resizable()
                                    .frame(width: 120, height: 60)
                                    .cornerRadius(40)
                            }
                            Spacer()
                            VStack(alignment:.center) {
                                Text("\(dish.nameDish)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .padding(.bottom,10)
                                Text("N\(dish.price)")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("MyOrange"))
                                HStack {
                                    Button {
        //                                dish.count = dish.count + 1
                                    } label: {
                                        Text("-")
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.gray)
                                            .background(
                                                RoundedRectangle(cornerRadius:3)
                                                    .foregroundColor(Color("Silver"))
                                            )
                                    }
                                    Text("\(dish.count ?? 0)")
                                    Button {
        //                                dish.count = dish.count + 1
                                    } label: {
                                        Text("+")
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.gray)
                                            .background(
                                                RoundedRectangle(cornerRadius:3)
                                                    .foregroundColor(Color("Silver"))
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,20)
                    }
                    
                    VStack {
                        HStack {
                            Text("Дополнительно")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .padding(.leading,25)
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    VStack {
                        HStack {
                            Text("Соусы")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .padding(.leading,25)
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                                VStack {
                                    Image("DopImage")
                                    HStack {
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 10))
                                        Text("200")
                                            .font(.system(size: 10))
                                            .frame(width: 30, height: 15)
                                            .background(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Text("Order Price")
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(FullPrice)$$")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal,15)
                    }
                    .frame(width: 315, height: 45)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("MyOrange"))
                            .opacity(0.5)
                    )
                    Spacer()
                    VStack {
                        Button {
                            
                        } label: {
                            Text("Order Now")
                                .foregroundColor(.white)
                                .frame(width: 315, height: 70)
                                .background(
                                    Capsule()
                                        .foregroundColor(Color("MyOrange"))
                                )
                        }

                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
            }
            Spacer()
        }
        .onAppear{
            for x in cart {
                FullPrice = FullPrice + Int(x.price ?? "")! * (x.count ?? 0)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 30)
        .overlay(
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        OverlayActive = "home"
                        screen = "MainScreen"
                    }
                } label: {
                    Image(OverlayActive == "home" ? "homeUsed" :"home")
                }
                Spacer()
                Button {
                    withAnimation {
                        OverlayActive = "cart"
                        screen = "OrderScreen"
                    }
                } label: {
                    Image(OverlayActive == "cart" ? "cartUsed" :"cart")
                }
                Spacer()
                Button {
                    OverlayActive = "user"
                } label: {
                    Image(OverlayActive == "user" ? "userUsed" :"user")
                }
                Spacer()
                Button {
                    withAnimation {
                        OverlayActive = "history"
                        screen = "HistoryScreen"
                    }
                } label: {
                    Image(OverlayActive == "history" ? "historyUsed" :"history")
                }
                Spacer()

            }
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(
                 Color("Silver")
                )
            ,alignment: .bottom
        )
    }
}

//struct OrderScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderScreen()
//    }
//}
