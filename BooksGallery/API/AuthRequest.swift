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
    @Published var user: User?

    func loginToApi(email: String, password: String){
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
            if statusCode == 400{
                DispatchQueue.main.async {
                    authError = responseString
                }
                return
            }else{
                DispatchQueue.main.async {
                    authError = nil
                    authenticated = true
                  UserDefaults.standard.set(responseString, forKey: "token")
                    let jwt = try? decode(jwt: responseString)
                    if jwt != nil {
                        let Id = jwt!.subject!
                        UserDefaults.standard.set(Id, forKey: "userId")
                    }
                }
                return
            }
            
        }.resume()
        
    }
    
    // sign in function
    func signUp(email: String, name: String, password: String, birthdate: String){
        print("birthbay", birthdate)
        guard let url = URL(string: "http://localhost:1000/user/createUser") else {return}
        
        let body:[String: String] = ["name": name, "email": email, "password": password, "birthdate": birthdate]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // my session
        URLSession.shared.dataTask(with: request){ (data, response, error) in

            guard let data = data else {return}
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 400 {
                DispatchQueue.main.async {
                    self.authError = String(data: data, encoding: .utf8)!
                }
                return
            }
            if statusCode == 200 {
                let decodedUser = try? JSONDecoder().decode(User.self, from: data)
                
                if decodedUser != nil {
                    DispatchQueue.main.async {
                        self.user = decodedUser
                        self.authenticated = true
                    }
                }else {
                        self.authError = "could decode the user"
                        return

                }
            }

        }.resume()
    }
    
    
    func getTheUser()  {
        if isLoginIn(){
            // providing my URL with the token
            let token = UserDefaults.standard.object(forKey: "token") as! String
            guard let url = URL(string: "http://localhost:1000/user/me?authorization=\(token)") else {return}
            
            //my request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            //my session
            URLSession.shared.dataTask(with: request){ (data , response, error) in
                guard let data = data else {return}
                let statusCode = (response as! HTTPURLResponse).statusCode
                if statusCode == 404 {
                    self.authError = "User Not Found "
                    return
                }
                if statusCode == 401 {
                    self.authError = "Access denied. No token provided."
                    return
                }
                let decodedUser = try? JSONDecoder().decode(User.self, from: data)
                if decodedUser != nil{
                    DispatchQueue.main.async {
                        self.user = decodedUser
                    }
                }else{
                    self.authError = "User can not be decoded "
                    return
                }
            }.resume()
        }
    }
    
    func isLoginIn() -> Bool{
        let str = UserDefaults.standard.object(forKey: "token") as? String
        return str == nil ? false : true
    }
}

