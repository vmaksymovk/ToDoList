//
//  ProfileView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user : User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding(.bottom, 20)
        
        //Info about user
        
        VStack(){
            HStack{
                Text("Name :")
                    .bold()
                Text(user.name)
            }
            .padding(.bottom, 20)
            HStack{
                Text("Email :")
                    .bold()
                Text(user.email)
            }
            .padding(.bottom, 20)
            HStack{
                Text("Member since :")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }.padding(.bottom, 20)
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
