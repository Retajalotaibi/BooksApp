//
//  ContentView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthHttpReq
    var body: some View {
        Group{
            if authState.authenticated || authState.getTheUserId(){
                AppView()
            }else{
                AuthView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthHttpReq())
    }
}
