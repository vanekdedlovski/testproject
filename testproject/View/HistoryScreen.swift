//
//  HistoryScreen.swift
//  testproject
//
//  Created by bnkwsr4 on 06.02.2022.
//

import SwiftUI

struct HistoryScreen: View {
    @Binding var screen : String
    @EnvironmentObject var viewModule : ViewModule
    @Binding var currentDish : Dishes?
    @Binding var OverlayActive : String
    @Binding var cart : [Dishes]
    var body: some View {
        VStack {
            Text("13")
        }
    }
}

//struct HistoryScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryScreen()
//    }
//}
