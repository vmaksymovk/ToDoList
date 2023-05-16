//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userID : String
    init(userID : String){
        self.userID  = userID
    }
    
    
    var body: some View {
        
        NavigationView(){
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                }
            label: {
                Image(systemName: "plus")
            }
            }.sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "")
    }
}
