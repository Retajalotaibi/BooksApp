//
//  AuthView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/26/20.
//

import SwiftUI
import Introspect

struct AuthView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var number = ""
    @State var authType: AuthenticationType = .login
    var body: some View {
        VStack{
            Text("Join our community of books lovers !").font(.system(size: 20)).fontWeight(.bold).padding(.top, 45)
            LottieView(name: "login").padding().frame(width: 400, height: 225)
            HStack{ 
                FormButton(Myindex: .login, currentIndex: self.$authType)
                FormButton(Myindex: .signup, currentIndex: self.$authType)
            }.background(Color("blue-2").opacity(0.1))
            .clipShape(Capsule())
            if self.authType == .login {
                Login(email: self.$email, password: self.$password)
            }else{
                SignIn(name: self.$name, number: self.$number, email: self.$email, password: self.$password)
            }
            Spacer()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(AuthHttpReq())
    }
}

struct FormButton: View {
    var Myindex: AuthenticationType
    @Binding var currentIndex: AuthenticationType
    var body: some View {
        Button(action: {
            self.currentIndex = Myindex
        }, label: {
            Text(self.Myindex.text)
                .foregroundColor(self.currentIndex == Myindex ? .white : .gray)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
        }).background(self.currentIndex == Myindex ? Color("blue-1") : Color.clear)
        .clipShape(Capsule())
    }
}


struct Login: View{
    @Binding var email: String
    @Binding var password: String
    @EnvironmentObject var manager: AuthHttpReq
    var body: some View{
        VStack{
            HStack(spacing: 15){
                Image(systemName: "envelope.fill")
                    .foregroundColor(.black)
                TextField("Email Address", text: self.$email).modifier(toolBar())
            }
            Divider().background(Color.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        VStack{
            HStack(spacing: 15){
                Image(systemName: "eye.slash.fill") .foregroundColor(.black)
                TextField("Password", text: self.$password).modifier(toolBar())
            }
            Divider().background(Color.white.opacity(0.5))
        }.padding(.horizontal)
        .padding(.top, 20)
        if manager.authError != nil {
            Text(manager.authError!).font(.subheadline).frame(width: 400,alignment: .leading).foregroundColor(.red).padding(6)
        }
        Button(action: {
        manager.loginToApi(email: self.email, password: self.password)
        }, label: {
            Text("Login")
                .foregroundColor(.white).fontWeight(.bold).padding(.vertical, 10).frame(width: (UIScreen.main.bounds.width - 50) / 2)
        }).background(Color("blue-1")).clipShape(Capsule()).padding(.top, 40)
    }
}

struct SignIn: View{
    @Binding var name: String
    @Binding var number: String
    @Binding var email: String
    @Binding var password: String
    @EnvironmentObject var manager: AuthHttpReq
    @State var formattedDate = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        return formatter
    }
    @State private var birthDate = Date()
    var body: some View{
        VStack{
            HStack(spacing: 15){
                Image(systemName: "person.fill")
                    .foregroundColor(.black)
                TextField("Name", text: self.$name).modifier(toolBar())
            }
            Divider().background(Color.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        VStack{
            HStack(spacing: 15){
                Image(systemName: "envelope.fill")
                    .foregroundColor(.black)
                TextField("Email Address", text: self.$email).modifier(toolBar())
            }
            Divider().background(Color.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        VStack{
            HStack(spacing: 15){
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.black)
                DatePicker("your birthday",selection: $birthDate, in: ...Date(), displayedComponents: .date).foregroundColor(.secondary)
            }
            Divider().background(Color.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        VStack{
            HStack(spacing: 15){
                Image(systemName: "eye.slash.fill") .foregroundColor(.black)
                TextField("Password", text: self.$password).modifier(toolBar())
            }
            Divider().background(Color.white.opacity(0.5))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        Button(action: {
            self.formattedDate = dateFormatter.string(from: birthDate)
            manager.signUp(email: self.email, name: self.name, password: self.password, birthdate: self.formattedDate)
        }, label: {
            Text("Sign Up")
                .foregroundColor(.white).fontWeight(.bold).padding(.vertical, 10).frame(width: (UIScreen.main.bounds.width - 50) / 2)
        }).background(Color("blue-1")).clipShape(Capsule()).padding(.top , 20)
    }
}

