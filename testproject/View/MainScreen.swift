//
//  MainScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI
import Kingfisher
import GoogleMobileAds

struct MainScreen: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    @State var currentFoods : [Dishes] = []
    
    @Binding var currentDish : Dishes?
    @State var IsActive = "Foods"
    @Binding var OverlayActive : String
    @State var IsActiveSearch = true
    @State var SearchActive = ""
    @State var colums:[GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2 - 50), spacing: 20)]
    @State var IsActiveCart = false
    @Binding var cart : [Dishes]
    @State var number : Int = 0
    @State var UsedActiveAddToCart = false
    var body: some View {
        VStack {
            if (IsActiveSearch) {
                HStack {
                    TextField("",text: $viewModule.poisk, prompt: Text("Выберите адрес доставки"))
                    Button {
                       
                    } label: {
                        Image("location")
                    }

                    Button {
                        IsActiveSearch = false
                    } label: {
                        Image("lupa")
                    }

                }
                .padding(.horizontal,25)
            }
            GoogleAds()
                .frame(width: GADAdSizeMediumRectangle.size.width, height: GADAdSizeMediumRectangle.size.height)
            if (!IsActiveSearch) {
                HStack {
                    Spacer()
                    TextField("",text: $SearchActive, prompt: Text("Search"))
                        
                    Button {
                        IsActiveSearch = true
                        currentFoods = viewModule.dishes.filter{$0.category == IsActive}
                    } label: {
                        Image("cancel")
                    }

                    Button {
                       
                    } label: {
                        Image("lupa")
                    }
                    Spacer()

                }
                .frame(width: 330, height: 40)
                .background(
                    Capsule()
                        .foregroundColor(.white)
                )
                
            }
            if (SearchActive == "")  {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            IsActive = "Foods"
                            currentFoods = viewModule.dishes.filter{$0.category == "Foods"}
                        }
                    } label: {
                        VStack {
                            Text("Foods")
                                .foregroundColor(IsActive == "Foods" ? Color("MyOrange") : Color("MyGray"))
                            Rectangle()
                                .frame(width: 80, height: 3)
                                .foregroundColor(IsActive == "Foods" ? Color("MyOrange") : Color.clear)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            IsActive = "Drinks"
                            currentFoods = viewModule.dishes.filter{$0.category == "Drinks"}
                        }
                    } label: {
                        VStack {
                            Text("Drinks")
                                .foregroundColor(IsActive == "Drinks" ? Color("MyOrange") : Color("MyGray"))
                            Rectangle()
                                .frame(width: 80, height: 3)
                                .foregroundColor(IsActive == "Drinks" ? Color("MyOrange") : Color.clear)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            IsActive = "Snacks"
                            currentFoods = viewModule.dishes.filter{$0.category == "Snacks"}
                        }
                    } label: {
                        VStack {
                            Text("Snacks")
                                .foregroundColor(IsActive == "Snacks" ? Color("MyOrange") : Color("MyGray"))
                            Rectangle()
                                .frame(width: 80, height: 3)
                                .foregroundColor(IsActive == "Snacks" ? Color("MyOrange") : Color.clear)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            IsActive = "Sauce"
                            currentFoods = viewModule.dishes.filter{$0.category == "Sauce"}
                        }
                    } label: {
                        VStack {
                            Text("Sauce")
                                .foregroundColor(IsActive == "Sauce" ? Color("MyOrange") : Color("MyGray"))
                            Rectangle()
                                .frame(width: 80, height: 3)
                                .foregroundColor(IsActive == "Sauce" ? Color("MyOrange") : Color.clear)
                        }
                    }
                    Spacer()

                }
            }
            if (SearchActive != "")  {
                VStack {
                    HStack {
                        Text("Result")
                            .font(.custom("Itallianno-Regular", size: 30))
                        Spacer()
                    }  .padding(.horizontal,25)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 40)
              
            }
            VStack {
                ScrollView(.vertical) {
                    if (IsActiveCart) {
                        VStack {
                            HStack {
                                Button {
                                    IsActiveCart = false
                                    UsedActiveAddToCart = false
                                } label: {
                                    Text("<")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }
                                Spacer()
                                Button {
                                    withAnimation {
                                        screen = "OneitemScreen"
                                    }
                                } label: {
                                    Text("More")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }


                            }
                            .padding(.top,15)
                            .padding(.horizontal,15)
                            Spacer()
                            HStack {
                                VStack {
                                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                                        .resizable()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(60)
                                }
                                VStack {
                                    Text("**\(currentDish?.nameDish ?? "")**")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 22))
                                        .padding(.bottom,21)
                                   
                                    Text("N\(currentDish?.price ?? "")")
                                        .foregroundColor(Color("MyOrange"))
                                        .font(.system(size: 17))
                                        .padding(.top,21)
                                }
                                
                            }
                            Spacer()
                            if (!UsedActiveAddToCart) {
                                HStack {
                                    Button {
                                        if (number <= 0 ) {
                                            number = 0
                                        } else
                                        {
                                            number = number - 1
                                        }
                                        
                                    } label: {
                                        Text("-")
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.gray)
                                            .background(
                                                RoundedRectangle(cornerRadius:3)
                                                    .foregroundColor(Color("Silver"))
                                            )
                                    }
                                    Text("\(number)")
                                    Button {
                                        number = number + 1
                                    } label: {
                                        Text("+")
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(.gray)
                                            .background(
                                                RoundedRectangle(cornerRadius:3)
                                                    .foregroundColor(Color("Silver"))
                                            )
                                    }
                                   
                                    VStack {
                                        Button {
                                            UsedActiveAddToCart = true
                                            currentDish?.count = number
                                            do {
                                                cart.append(currentDish!)
                                                                                                
                                                let data = try JSONEncoder().encode(cart)
                                                
                                                UserDefaults.standard.set(data, forKey: "cart")
                                               
                                            }
                                            catch {
                                                print(cart)
                                            }
                                        } label: {
                                            HStack {
                                                Text("Add to cart")
                                                    .foregroundColor(.white)
                                                Image("cart")
                                                    .foregroundColor(.black)
                                            }
                                            .frame(width: 200, height: 40)
                                            .background(
                                                Capsule()
                                                    .foregroundColor(Color("MyOrange"))
                                            )
                                        }
                                    }
                                    .padding(.leading,10)


                                }
                                .padding(.bottom,10)
                            }
                            if (UsedActiveAddToCart) {
                                Button {
                                    
                                } label: {
                                    Text("Continue Shop")
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 40)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color("MyOrange"))
                                        )
                                }
                                Button {
                                    
                                } label: {
                                    Text("Go to cart")
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 40)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color("MyOrange"))
                                        )
                                }

                            }
                           
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 330)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.white)
                        )
                    }
                    if (!IsActiveCart) {
                        LazyVGrid(columns: colums,spacing: 70) {
                            ForEach(currentFoods,id :\.dishId) { dish in
                                VStack {
                                    Text("**\(dish.nameDish)**")
                                        .padding(.top,60)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 18))
                                        
                                    Text("N\(dish.price)")
                                        .padding(.top,20)
                                        .font(.system(size: 17))
                                        .foregroundColor(Color("MyOrange"))
                                }
                                .onTapGesture(perform: {
                                    currentDish = dish
                                    IsActiveCart = true
                                })
                                .frame(width: 156, height: 200)
                               
                                .background(
                                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(dish.icon ?? "")"))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(70)
                                        .offset(y: -30)
                                    ,alignment: .top
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                        .foregroundColor(.white)
                                )
                            }
                        }
                    }
                }
                .padding(.top,20)
                
            }
            .onAppear {
//                viewModule.GetVersion {
//                    viewModule.GetDishes {
//                        currentFoods = viewModule.dishes.filter{$0.category == "Foods"}
//                    }
//                }
                
                currentFoods = viewModule.dishes.filter{$0.category == "Foods"}
                do {
                    let cartJson = UserDefaults.standard.data(forKey: "cart")
                    let cartDecon = try JSONDecoder().decode([Dishes].self, from: cartJson ?? Data())
                    self.cart = cartDecon
                    print(cart)
                   
                }
                catch {
                    print("error")
                }
            }
            
            Spacer()
        }
        .onChange(of: SearchActive, perform: { newValue in
            currentFoods = viewModule.dishes.filter{$0.nameDish.contains(newValue)}
        })
        .background(
            Color("Silver")
        )
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

//struct MainScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MainScreen()
//    }
//}
struct Cart : Codable {
    let dishId : String
    let count : Int
}
