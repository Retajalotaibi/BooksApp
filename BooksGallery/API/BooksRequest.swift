//
//  BooksRequest.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 1/20/21.
//

import Foundation
import Combine


class BooksRequest: ObservableObject{
    @Published var books: [BookModel] = []
    
    
    func getAllBooks(){
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else {return}
        guard let url = URL(string: "http://localhost:1000/books/allbooks?authorization=\(token)") else {return}
        
        
        
    }
}
