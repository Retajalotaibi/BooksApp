//
//  ProfilePageView.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 12/18/20.
//

import SwiftUI

struct ProfilePageView: View {
    @EnvironmentObject var auth: AuthHttpReq
    @State var index: ViewType = .profile
    
    var body: some View {
        VStack{
            VStack{
                Text(auth.user?.name ?? "").font(.title2).bold().padding(.top, 10)
                Image("cat2").resizable().aspectRatio(contentMode: .fit).frame(width: 130).clipShape(Circle())
            }
            HStack{
                VStack{
                    Text("Profile").onTapGesture {
                        self.index = .profile
                    }
                    if index == .profile {
                        Divider().frame(height: 2).background(Color.black)
                    }else{
                        Divider()
                    }
                }
                Spacer()
                VStack{
                    Text("favourite Books").onTapGesture {
                        self.index = .favBooks
                    }
                    if index == .favBooks {
                        Divider().frame(height: 2).background(Color.black)
                    }else{
                        Divider()
                    }
                }
            }.padding()
            Spacer()
            HStack {
                if self.index == .profile {
                    ProfileView()
                }else{
                    FavBooks()
                }
            }
            Spacer()
        }.onAppear {
            auth.getTheUser()
        }
        
    }
    
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView().environmentObject(AuthHttpReq())
    }
}



//Profile view
struct ProfileView: View{
    @EnvironmentObject var env: AuthHttpReq
    var body: some View{
        Form{
            Text("Name\t\t\(env.user?.name ?? "")")
            Text("Birthday\t\t\(env.user?.birthdate ?? "")")
            Text("email\t\t\(env.user?.email ?? "")")
            Button(action: {
                print("loged out")
            }, label: {
                Text("logout").foregroundColor(.red)
            })
        }
    }
}

//Favourite books view
struct FavBooks: View {
    var body: some View{
        Text("fav books")
    }
}
