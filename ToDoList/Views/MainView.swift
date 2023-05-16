//
//  ContentView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
            accountView
        }
        else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView : some View{
        TabView {
            ToDoListView(userID : viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
