//
//  MainPage.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//

import SwiftUI
import Pages
import SDWebImageSwiftUI
struct MainPage: View {
    @EnvironmentObject var bookReq: BooksRequest
    @State var currentPage = 0
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(bookReq.books, id: \.self) { (book) in
                            let imageurl = URL(string: book.bookImage)
                            NavigationLink(
                                destination: BookDetalisView(book: book, reviews: book.reviews, imageURL: imageurl)
                                    .navigationBarItems(trailing: Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "star").foregroundColor(.white)
                                    })),
                                label: {
                                    VStack{
                                        WebImage(url: imageurl).resizable().scaledToFit().frame(height: 230).cornerRadius(10)
                                    }.padding()
                                }).foregroundColor(.black)
                        }
                    }
                }
                Spacer()
            }.navigationTitle("Discover")
            
        }.navigationViewStyle(StackNavigationViewStyle()).accentColor(.white).onAppear {
              bookReq.getAllBooks()
        }
    }
}
//

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(BooksRequest())
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
