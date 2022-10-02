//
//  ContentView.swift
//  Udder
//
//  Created by Javier Lasso on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Udder")
                .foregroundColor(Color(red: 0.50, green: 0.55, blue: 0.55, opacity: 1.00))
                .bold()
                .padding()
                .font(.system(size: 40))
            Text("Fresh Milk, On Demand.")
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
