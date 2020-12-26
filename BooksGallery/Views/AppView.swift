//
//  AppView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/17/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ProfilePageView().tabItem{
                Image(systemName: "list.dash")
                Text("test")
            }
            
            MainPage().tabItem{
                Image(systemName: "list.dash")
                Text("main")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(AuthHttpReq())
    }
}
