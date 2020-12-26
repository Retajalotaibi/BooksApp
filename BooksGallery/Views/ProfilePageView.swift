//
//  ProfilePageView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/18/20.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "person.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 100).padding(.top, 100)
                Text("Retaj alotaibi").padding().font(.largeTitle)
            }.padding()
            Spacer()
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
