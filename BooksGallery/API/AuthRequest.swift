//
//  AuthRequest.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/25/20.
//

import Foundation
import SwiftUI
import Combine
import JWTDecode

enum authError: Error {
    case emailIsEmpty, passwordIsEmpty, ShortPassword, InvalidEmail,InvalidPassword
    
}

class AuthHttpReq: ObservableObject {
    @Published var didChange = PassthroughSubject<AuthHttpReq, Never>()
    @Published var authenticated = false
    @Published var authError: String? = nil

    func checkDetails(email: String, password: String){
        // my URL
        guard let url = URL(string: "http://localhost:1000/user/login") else {return}
        
        // the body and converting the body to JSON
        let body: [String: String] = ["email": email, "password": password]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        // my request settings
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // my session
        URLSession.shared.dataTask(with: request){ [self] (data, response , error) in
            //make sure the data is here
            guard let data = data else {return}
            //finding the status code
            let statusCode = (response as! HTTPURLResponse).statusCode
            //not a good idea but works
            let responseString = String(data: data, encoding: .utf8)!
           
            // :)
            if (statusCode == 400){
                print("yo" ,responseString)
                DispatchQueue.main.async {
                    authError = responseString
                }
                return
            }else{
                DispatchQueue.main.async {
                    print(responseString)
                    authError = nil
                    authenticated = true
                  UserDefaults.standard.set(responseString, forKey: "token")
                    print("uaer Defaults", UserDefaults.standard.object(forKey: "token") as! String)
                }
                return
            }
            
        }.resume()
        
    }
    
    func getTheUserId() -> Bool {
            let str = UserDefaults.standard.object(forKey: "token") as! String
            let jwt = try? decode(jwt: str)
            print("jwt", jwt)
            return str.count > 0 ? true : false
    }
    
    func isLoginIn() -> Bool{
        let str = UserDefaults.standard.object(forKey: "token") as! String
        return str.count > 0 ? true : false
    }
}

