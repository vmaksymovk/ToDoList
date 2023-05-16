//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore
class RegisterViewModel : ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {
        
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
            
        }
    }
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        // Проверка формата email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValidEmail = emailPredicate.evaluate(with: email)
        
        if !isValidEmail {
//            errorMessage = "Please, enter valid email"
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        return true
        
        
        
        
    }
    
}
