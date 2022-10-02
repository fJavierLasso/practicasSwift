//
//  ContentView.swift
//  JaviCard
//
//  Created by Javier Lasso on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image("javier")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white,lineWidth: 2))

                Text("Javier Lasso")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(5)
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    
                Divider()
                InfoView(text: "+34 673 010 844", imageName: "phone.fill")
                InfoView(text: "lassavins@gmail.com", imageName: "envelope.fill")
                    
                                
                
                    
                           }
                
            }
            
        
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


