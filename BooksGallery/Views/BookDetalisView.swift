//
//  BookDetalisView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 1/20/21.
//

import SwiftUI

let book: BookModel = .init(bookName: "The Mermaid", author: "Christina Henry", description: "A re-imagining of the Fiji mermaid's story, Christina Henry's The Mermaid centers on Amelia, a mermaid who left the sea behind to marry a fisherman. But when her husband is lost to the waves, Amelia finds herself courted by P.T. Barnum, who knows that a mermaid is just what he needs to make his traveling show a success.", releaseDate: "June 19, 2018", bookImage: "13 Mermaid", category: "Fantasy", rate: 2)



struct BookDetalisView: View {
    @State var currentView: SubViewType = .description
    var body: some View {
        VStack {
            ZStack {
                Group{
                   // Image(book.bookImage).resizable().scaledToFill().blur(radius: 30)
                    Color.black.opacity(0.3).background(Image(book.bookImage).resizable().scaledToFill().blur(radius: 30))
                    
                }.edgesIgnoringSafeArea(.all)
                VStack{
                    VStack {
                        Text("Book Detalis")
                        Image(book.bookImage).resizable().scaledToFit().frame(height: 200).padding(.top, 60)
                        Text(book.bookName).bold().foregroundColor(.white)
                        Text("By \(book.author)").foregroundColor(.white)
                        Spacer()
                    }
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
                                    Text("\(book.rate)")
                                    Text("Rate").foregroundColor(.gray).font(.system(size: 10)).padding(.top,2)
                                }
                                DividerView()
                            }
                            
                            VStack{
                                Text(book.releaseDate)
                                Text("Date").foregroundColor(.gray).font(.system(size: 10)).padding(.top,2)
                            }
                            
                        }.frame(width: (UIScreen.main.bounds.width / 2) + 160, height: 80).background(Color("bg-r")).cornerRadius(11).padding()
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
                                VStack{
                                    Text("YO")
                                    Text("YO")
                                    Text("YO")
                                    Text("YO")
                                    Text("YO")
                                }
                            }
                        }.padding([.trailing,.leading], 30)
                    }.cornerRadius(30).frame(maxWidth: .infinity , maxHeight:  (UIScreen.main.bounds.height/2)).background(Color("bg-w")).cornerRadius(30)
                }.ignoresSafeArea()
            }
        }
    }
}
//.padding([.leading, .trailing], 50)
struct BookDetalisView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetalisView()
    }
}

struct DividerView: View{
    var body: some View{
        Divider().frame(width: 1.5, height: 50).background(Color.gray).padding()
    }
}
