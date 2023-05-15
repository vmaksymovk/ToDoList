//
//  RegisterView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundcolor: .orange)
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
