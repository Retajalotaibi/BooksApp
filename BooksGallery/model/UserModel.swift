//
//  UserModel.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/27/20.
//

import Foundation


struct User: Codable{
    
    var _id: String
    var email: String
    var name: String
    var birthdate: String
    var favouriteBooks: [favouriteBook]
}


struct favouriteBook: Codable{
    var _id: String
    var favouriteBookId: String
}
