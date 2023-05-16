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
            //signed in
            ToDoListView()
        }
        else{
            LoginView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
