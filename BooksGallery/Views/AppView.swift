//
//  AppView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/17/20.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var authState: AuthHttpReq
    @State var index = 0
    var body: some View {
        VStack{
           // Spacer()
            if index == 0 {
                ProfilePageView()
            }else{
                MainPage().environmentObject(BooksRequest())
            }
            customTapBar(index: $index)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(AuthHttpReq())
    }
}


struct customTapBar: View {
    @Binding var index: Int
    @State var expand = false
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            HStack{
                if !self.expand{
                    Button(action: {
                        expand.toggle()
                    }, label: {
                        Image(systemName:  "arrow.left").foregroundColor(.black).padding()
                    })
                }else {
                    Button(action: {
                        index = 0
                    }, label: {
                        Image(systemName: "person.crop.circle.fill").foregroundColor(index == 0 ? .black : .gray)//.font(.system(size: 23))
                    })
                    Spacer(minLength: 15)
                    Button(action: {
                        index = 1
                    }, label: {
                        Image(systemName: "books.vertical.fill").foregroundColor(index == 1 ? .black : .gray)//.font(.system(size: 23))
                    })
                }
                
            }.padding(.vertical,self.expand ? 20 : 5)
            .padding(.horizontal,self.expand ? 35 : 5)
            .background(Color.white)
            .clipShape(Capsule())
            .padding([.leading, .trailing], 20)
            .shadow(radius: 5)
            .onTapGesture {
                self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.10))
        }
    }
}

