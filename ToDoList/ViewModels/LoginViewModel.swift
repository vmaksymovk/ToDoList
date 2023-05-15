//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import Foundation
import FirebaseAuth
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {
        
    }

    func login() {
        
        guard validate() else{
            return
        }
        
        // try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }

    func validate() -> Bool {
        
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please, fill in all fields"
            
            return false
        }
        
        
        // Проверка формата email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValidEmail = emailPredicate.evaluate(with: email)
        
        if !isValidEmail {
            errorMessage = "Please, enter valid email"
            return false
        }
        
        
        
        return true
    }
}

