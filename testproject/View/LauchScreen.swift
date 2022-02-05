//
//  LauchScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import SwiftUI

struct LauchScreen: View {
    @Binding var screen : String
    @EnvironmentObject var netWork : Network
    @EnvironmentObject var viewModule : ViewModule
    var body: some View {
        VStack{
            ZStack {
                Image("lauch")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                Image("launch1")
                Image("textwsr")
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        .onAppear {
            do {
                let dishesJson = UserDefaults.standard.data(forKey: "dishes")
                debugPrint(dishesJson)
                let dishesData =  try JSONDecoder().decode([Dishes].self, from: dishesJson ?? Data())
                debugPrint(dishesData)
                viewModule.dishes = dishesData
                
            }
            catch {
                print(error.localizedDescription)
                if (netWork.IsConnect) {
                    viewModule.GetVersion {
                        viewModule.GetDishes {
                            do {
                                let data = try JSONEncoder().encode(viewModule.dishes)
                                UserDefaults.standard.set(data, forKey: "dishes")
                            }
                            catch {
                                print("123")
                            }

                        }
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()) {
                    screen = "OnBoardingScreen"
                }
            }
        }
    }
}

//struct LauchScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LauchScreen()
//    }
//}
