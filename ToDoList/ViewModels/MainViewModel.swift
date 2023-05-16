//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//
import FirebaseAuth
import Foundation

class MainViewViewModel : ObservableObject{
    @Published var currentUserID : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
