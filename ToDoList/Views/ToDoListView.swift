//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @FirestoreQuery var items : [ToDoListItem]
    @StateObject var viewModel = ToDoListViewViewModel()
    
    
    private let userID : String
    init(userID : String){
        self.userID  = userID
        
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
    }
    
    
    var body: some View {
        
        NavigationView(){
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)

                        }
                }.listStyle(SidebarListStyle())
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
        ToDoListView(userID: "XPPfVvBPzaf6q974ynTAOrfcICy1")
    }
}
