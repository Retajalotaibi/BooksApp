//
//  BookDetalisView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 1/20/21.
//

import SwiftUI
import SDWebImageSwiftUI
let bookExapmle: BookModel = .init(_id: "23456543", bookName: "The Mermaid", author: "Christina Henry", description: "A re-imagining of the Fiji mermaid's story, Christina Henry's The Mermaid centers on Amelia, a mermaid who left the sea behind to marry a fisherman. But when her husband is lost to the waves, Amelia finds herself courted by P.T. Barnum, who knows that a mermaid is just what he needs to make his traveling show a success.", releaseDate: "June 19, 2018", bookImage: "13 Mermaid", category: "Fantasy", rate: 2, reviews: [])



struct BookDetalisView: View {
    @State var currentView: SubViewType = .description
    @State var book: BookModel
    @State var reviews: [BookRviews]
    @State var imageURL: URL?
    var body: some View {
        VStack {
            ZStack {
                Group{
                    Color.black.opacity(0.3).background(WebImage(url: imageURL).resizable().scaledToFill().blur(radius: 30))
                    
                }.edgesIgnoringSafeArea(.all)
                VStack{
                    VStack {
                        Text("Book Detalis")
                        WebImage(url: imageURL).resizable().scaledToFit().frame(height: 200).padding(.top, 60)
                        Text(book.bookName).bold().foregroundColor(.white)
                        Text("By \(book.author)").foregroundColor(.white)
                    }.padding(20)
              
                        VStack{
                            HStack{
                                HStack{
                                    VStack {
                                        Text(book.category)
                                        Text("Category").foregroundColor(.gray).font(.system(size: 10)).padding(.top,2)
                                    }
                                    DividerView()
                                }
                                HStack{
                                    VStack{
                                        Text(String(format: "%.1f", book.rate))
                                        Text("Rate").foregroundColor(.gray).font(.system(size: 10)).padding(.top,2)
                                    }
                                    DividerView()
                                }
                                
                                VStack{
                                    Text(book.releaseDate)
                                    Text("Date").foregroundColor(.gray).font(.system(size: 10)).padding(.top,2)
                                }
                                
                            }.frame(width: (UIScreen.main.bounds.width / 2) + 160, height: 65).background(Color("bg-r")).cornerRadius(11).padding()
                            HStack{
                                ZStack{
                                    Text("description").bold().foregroundColor(currentView == .description ? .black : .gray).onTapGesture {
                                        currentView = .description
                                    }
                                    if currentView == .description {
                                        Divider().frame(width: 40, height: 3).background(Color.yellow).offset(x: -20, y: 15)
                                    }
                                }
                                ZStack {
                                    Text("comments").bold().foregroundColor(currentView == .comments ? .black : .gray).onTapGesture {
                                        currentView = .comments
                                    }
                                    if currentView == .comments {
                                        Divider().frame(width: 40, height: 3).background(Color.yellow).offset(x: -20, y: 15)
                                    }
                                }
                                Spacer()
                            }.padding(.leading, 20)
                            ScrollView{
                                if currentView == .description{
                                    Text(book.description).padding(.top, 10)
                                }else{
                                    ForEach(reviews, id: \.self) {   (review) in
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "person.circle.fill").foregroundColor(.gray).font(.system(size: 35))
                                                VStack(alignment: .leading){
                                                    Text(review.review_author).font(.system(size: 16)).bold()
                                                    Text(review.published_date).font(.system(size: 10))
                                                }
                                            }
                                            Text(review.review_text).fixedSize(horizontal: false, vertical: true).padding(.leading,50)
                                        }.padding([.top , .trailing], 20).frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, alignment: .leading)                                }
                                }
                                
                            }.padding([.trailing,.leading], 30)
                        }.frame(maxWidth: .infinity , maxHeight:  (UIScreen.main.bounds.height)).background(Color("bg-w"))
                 
                }.ignoresSafeArea()
            }
        }
    }
}
struct BookDetalisView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetalisView(book: bookExapmle, reviews: [], imageURL: URL(string: "https://firebasestorage.googleapis.com/v0/b/books-api-kwcodes.appspot.com/o/the-art-of-war.jpeg?alt=media&token=8fddf87a-ea46-45bb-a8fe-8497ff78b374")!)
    }
}

struct DividerView: View{
    var body: some View{
        Divider().frame(width: 1.5, height: 40).background(Color.gray).padding()
    }
}
struct reviewView: View {
    var book: BookModel
    var body: some View{
        VStack{
            Text(pp())
        }
    }
    
    func pp() -> String {
        for i in  book.reviews{
            print(i.review_text)
        }
        return "kjhgf"
    }
}
