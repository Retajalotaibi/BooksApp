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
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){  (data, response , error) in
            guard let data = data else {return}
       
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let decodedBooks = try decoder.decode([BookModel].self, from: data)
                    print("my books")
                    DispatchQueue.main.async {
                        self.books = decodedBooks
                    }
                }catch{
                    print("error",error)
                }
            }
        }.resume()
        
    }
}
