//
//  NewItemView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        
        VStack{
            Text(" Add new item here:")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 50)
            Form{
                //Title
                TextField("Titile", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }.padding()
                    
            }.scrollContentBackground(.hidden)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message:  Text("Please fill in all fields and select due date that is today or newer"))
                }
        }
        
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
