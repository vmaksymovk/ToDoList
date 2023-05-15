//
//  HeaderView.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subtitle : String
    let angle : Double
    let backgroundcolor : Color
    var body: some View {
        VStack{
            //Header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(backgroundcolor)
                    .rotationEffect(Angle(degrees: angle))
                    
                
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }.padding(.top, 40)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "SubTitle", angle: 15, backgroundcolor: .green)
    }
}
