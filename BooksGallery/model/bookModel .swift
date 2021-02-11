//
//  bookModel .swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 1/19/21.
//

import Foundation


struct BookModel: Identifiable, Hashable{
    var id = UUID()
    var bookName: String
    var author: String
    var description: String
    var releaseDate: String
    var bookImage: String
    var category: String
    var rate: Int
}


let books: [BookModel] = [
    .init(bookName: "The Mermaid", author: "Christina Henry", description: "A re-imagining of the Fiji mermaid's story, Christina Henry's The Mermaid centers on Amelia, a mermaid who left the sea behind to marry a fisherman. But when her husband is lost to the waves, Amelia finds herself courted by P.T. Barnum, who knows that a mermaid is just what he needs to make his traveling show a success.", releaseDate: "June 19, 2018", bookImage: "13 Mermaid", category: "Fantasy", rate: 2),
    
    .init(bookName: "Will Destroy the Galaxy for Cash", author: "Yohtzee Croshow", description: " Will Destroy the Galaxy for Cash is the follow up tale to Will Save the Galaxy for Food from the mind of writer Yahtzee Croshaw (Mogworld, Jam, Differently Morphous).With the age of heroic star pilots and galactic villains completely killed by quantum teleportation, the ex-star pilot currently named Dashford Pierce is struggling to find his identity in a changing", releaseDate: "November 17, 2020", bookImage: "will destory the galaxy for the cash ", category: "Science Fiction", rate: 4),
    .init(bookName: "Moby Dick or The Whale", author: "Herman Melville", description: "The book is the sailor Ishmael's narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the giant white sperm whale that on the ship's previous voyage bit off Ahab's leg at the knee", releaseDate: "October 18, 1851", bookImage: "Moby-Dick", category: "Novel", rate: 5),
    .init(bookName: "Silver Moon", author: "Jennifer Minton", description: "Hanna and her friends journey continues right where it left off. Vampires! Hanna can barely believe it. What else is out there and does she really want to find out? Now with a new ally in tow that has a grudge of their own, will they be able to defeat the evil that threatens the supernatural way of life?", releaseDate: "August 15, 2017", bookImage: "Silver Moon", category: "Fantasy", rate: 3),
 // repeate
        .init(bookName: "The Mermaid", author: "Christina Henry", description: "A re-imagining of the Fiji mermaid's story, Christina Henry's The Mermaid centers on Amelia, a mermaid who left the sea behind to marry a fisherman. But when her husband is lost to the waves, Amelia finds herself courted by P.T. Barnum, who knows that a mermaid is just what he needs to make his traveling show a success.", releaseDate: "June 19, 2018", bookImage: "13 Mermaid", category: "Fantasy", rate: 2),
        
        .init(bookName: "Will Destroy the Galaxy for Cash", author: "Yohtzee Croshow", description: " Will Destroy the Galaxy for Cash is the follow up tale to Will Save the Galaxy for Food from the mind of writer Yahtzee Croshaw (Mogworld, Jam, Differently Morphous).With the age of heroic star pilots and galactic villains completely killed by quantum teleportation, the ex-star pilot currently named Dashford Pierce is struggling to find his identity in a changing", releaseDate: "November 17, 2020", bookImage: "will destory the galaxy for the cash ", category: "Science Fiction", rate: 4),
        .init(bookName: "Moby Dick or The Whale", author: "Herman Melville", description: "The book is the sailor Ishmael's narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the giant white sperm whale that on the ship's previous voyage bit off Ahab's leg at the knee", releaseDate: "October 18, 1851", bookImage: "Moby-Dick", category: "Novel", rate: 5),
        .init(bookName: "Silver Moon", author: "Jennifer Minton", description: "Hanna and her friends journey continues right where it left off. Vampires! Hanna can barely believe it. What else is out there and does she really want to find out? Now with a new ally in tow that has a grudge of their own, will they be able to defeat the evil that threatens the supernatural way of life?", releaseDate: "August 15, 2017", bookImage: "Silver Moon", category: "Fantasy", rate: 3),
       .init(bookName: "The Mermaid", author: "Christina Henry", description: "A re-imagining of the Fiji mermaid's story, Christina Henry's The Mermaid centers on Amelia, a mermaid who left the sea behind to marry a fisherman. But when her husband is lost to the waves, Amelia finds herself courted by P.T. Barnum, who knows that a mermaid is just what he needs to make his traveling show a success.", releaseDate: "June 19, 2018", bookImage: "13 Mermaid", category: "Fantasy", rate: 2),
    
       .init(bookName: "Will Destroy the Galaxy for Cash", author: "Yohtzee Croshow", description: " Will Destroy the Galaxy for Cash is the follow up tale to Will Save the Galaxy for Food from the mind of writer Yahtzee Croshaw (Mogworld, Jam, Differently Morphous).With the age of heroic star pilots and galactic villains completely killed by quantum teleportation, the ex-star pilot currently named Dashford Pierce is struggling to find his identity in a changing", releaseDate: "November 17, 2020", bookImage: "will destory the galaxy for the cash ", category: "Science Fiction", rate: 4),
      .init(bookName: "Moby Dick or The Whale", author: "Herman Melville", description: "The book is the sailor Ishmael's narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the giant white sperm whale that on the ship's previous voyage bit off Ahab's leg at the knee", releaseDate: "October 18, 1851", bookImage: "Moby-Dick", category: "Novel", rate: 5),
      .init(bookName: "Silver Moon", author: "Jennifer Minton", description: "Hanna and her friends journey continues right where it left off. Vampires! Hanna can barely believe it. What else is out there and does she really want to find out? Now with a new ally in tow that has a grudge of their own, will they be able to defeat the evil that threatens the supernatural way of life?", releaseDate: "August 15, 2017", bookImage: "Silver Moon", category: "Fantasy", rate: 3)

]
