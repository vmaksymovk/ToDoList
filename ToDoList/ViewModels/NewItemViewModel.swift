//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        // get current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        //save model
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
