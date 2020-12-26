//
//  BooksGalleryApp.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/16/20.
//

import SwiftUI

@main
struct BooksGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthHttpReq())
        }
    }
}
