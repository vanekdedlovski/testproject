//
//  MainScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI
import Kingfisher

struct MainScreen: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    @State var currentFoods : [Dishes] = []
    @State var currentDish : Dishes?
    @State var IsActive = "Foods"
    @State var OverlayActive = "home"
    @State var IsActiveSearch = true
    @State var SearchActive = ""
    @State var colums:[GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2 - 50), spacing: 20)]
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
                .padding(.top,20)
                
            }
            .onAppear {
//                viewModule.GetVersion {
//                    viewModule.GetDishes {
//                        currentFoods = viewModule.dishes.filter{$0.category == "Foods"}
//                    }
//                }
                
                currentFoods = viewModule.dishes.filter{$0.category == "Foods"}
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
                   OverlayActive = "home"
                } label: {
                    Image(OverlayActive == "home" ? "homeUsed" :"home")
                }
                Spacer()
                Button {
                    OverlayActive = "cart"
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
                    OverlayActive = "history"
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
