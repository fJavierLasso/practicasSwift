//
//  InfoView.swift
//  JaviCard
//
//  Created by Javier Lasso on 2/6/21.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName:imageName)
                    .foregroundColor(.green)
                Text(text)
                    .foregroundColor(.black)
                    .bold()
                
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello world", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
