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
        
        NavigationView(){
            VStack{
                
            }
            .navigationTitle("Profile")
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
