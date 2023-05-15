//
//  HeaderView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            //Header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: 15))
                    
                
                VStack{
                    Text("To Do List")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    Text("Get things done")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }.padding(.top, 40)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -100)
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
