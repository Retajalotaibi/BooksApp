//
//  BooksTable.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/18/20.
//

import SwiftUI

struct BooksTable: View {
    var title: String
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text(title).font(.largeTitle).fontWeight(.bold).padding([.leading, .top], 20)
                    Spacer()
                }
                ScrollView(.vertical){
                    ForEach(0...5, id: \.self){ i in
                        HStack{
                            HStack{
                                Image("Moby-Dick").resizable().scaledToFit().frame(width: 80).padding([.leading, .bottom], 25)
                                VStack{
                                    Text("Moby Dick").padding()
                                    Text("jorrge scjbs")
                                }
                            }
                            Spacer()
                            Image(systemName: "star")
                                .foregroundColor(.black).padding(.trailing, 40)
                        }
                    }
                }
            }
        }
    }
    
}
struct BooksTable_Previews: PreviewProvider {
    static var previews: some View {
        BooksTable(title: "Popular Books")
    }
}
