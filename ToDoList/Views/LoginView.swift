//
//  LoginView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack {
                //Header
                HeaderView()
                
                //Login Form
                
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Button Login
                    Button {
                        // Attempt loggin
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Log in ")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                
                
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
