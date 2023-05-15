//
//  LoginView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundcolor: .green).padding(.top, 45)
                
                
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Button Login
                    TLButton(title: "Log in", background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden)
                    .scaleEffect(1.1)
                    .offset(y: -60)
                    
                
                
                // Create Account
                
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }.padding(.bottom, 30)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
