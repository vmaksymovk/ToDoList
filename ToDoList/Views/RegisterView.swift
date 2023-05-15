//
//  RegisterView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundcolor: .orange)
            
            Form{
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Create account", background: .green) {
                    // attempt reg
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
            .scaleEffect(1.1)
            .offset(y: -60)
            
            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
