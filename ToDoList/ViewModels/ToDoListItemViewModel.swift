//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
// ViewModel for single to do list item view
class ToDoListItemViewViewModel : ObservableObject{
    init() {
        
    }
    func toogleIsDone(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }

}
