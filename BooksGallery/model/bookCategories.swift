//
//  bookCategories.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/17/20.
//

import Foundation
import UIKit

struct BookCategories: Identifiable, Hashable{
    var id = UUID()
    var categor: String
    var image: String
    var color: String
}


let Categories: [BookCategories] = [ .init(categor: "Fantasy", image: "hat", color: "blue-1"), .init(categor: "history", image: "history", color: "blue-1"), .init(categor: "horror", image:  "ghost", color: "blue-1"), .init(categor: "classic", image: "classic", color: "blue-1"), .init(categor: "mystery", image: "black-hole", color: "blue-1"),.init(categor: "crime", image: "crime", color: "blue-1")]
