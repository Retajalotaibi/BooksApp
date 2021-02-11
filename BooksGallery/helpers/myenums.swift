//
//  myenums.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 2/9/21.
//

import Foundation

//this the enum I use in the profilePageView
enum ViewType{
    case profile , favBooks
}


//this is the enum I use in the authView
enum AuthenticationType: String {
    case login, signup
    
    var text: String {
        switch self {
        case .login: return "Login"
        case .signup: return "Sign Up"
        }
    }
}


// this is the enum I use in the BookDetalis
enum SubViewType{
    case description , comments
}
