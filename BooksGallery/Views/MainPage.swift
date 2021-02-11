//
//  MainPage.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//

import SwiftUI
import Pages

struct MainPage: View {
    @EnvironmentObject var authState: AuthHttpReq
    @State var currentPage = 0
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(books, id: \.self) { (book) in
                            NavigationLink(
                                destination: BookDetalisView(),
                                label: {
                                    VStack{
                                        Image(book.bookImage).resizable().scaledToFit().frame(height: 270).cornerRadius(10)
                                        Text(book.bookName).bold()
                                    }.padding()
                                }).foregroundColor(.black)
                        }
                    }
                }
                Spacer()
            }.navigationTitle("Discover")
        }.accentColor(.white)
    }
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(AuthHttpReq())
    }
}
struct CategoryView: View {
    var category: BookCategories
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("blue-1"), Color("blue")]), startPoint: .leading, endPoint: .trailing).frame(width: (UIScreen.main.bounds.width - 50) ).cornerRadius(9)
            VStack{
                Image(category.image).resizable().scaledToFit().frame(width: 60)
                Text(category.categor).fontWeight(.bold).foregroundColor(.white).padding(.top, 10)
            }
            
        }
    }
}

/*
 Pages(currentPage: self.$currentPage,hasControl: false ,pages: { () -> [AnyView] in
     NavigationLink(
         destination: BooksTable(title: Categories[0].categor),
         label: {
             CategoryView(category: Categories[0])
         })
     NavigationLink(
         destination: BooksTable(title: Categories[1].categor),
         label: {
             CategoryView(category: Categories[1])
         })
     NavigationLink(
         destination: BooksTable(title: Categories[2].categor),
         label: {
             CategoryView(category: Categories[2])
         })
     NavigationLink(
         destination: BooksTable(title: Categories[3].categor),
         label: {
             CategoryView(category: Categories[3])
         })
     NavigationLink(
         destination: BooksTable(title: Categories[4].categor),
         label: {
             CategoryView(category: Categories[4])
         })
     NavigationLink(
         destination: BooksTable(title: Categories[5].categor),
         label: {
             CategoryView(category: Categories[5])
         })
   /*  ForEach(Categories) { category in
         NavigationLink(
             destination: BooksTable(title: category.categor),
             label: {
                 CategoryView(category: category)
             })
     }*/
 }).frame(height: 150)

 */
