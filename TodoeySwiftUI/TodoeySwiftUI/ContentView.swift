//
//  ContentView.swift
//  TodoeySwiftUI
//
//  Created by Javier Lasso on 17/6/21.
//

import SwiftUI

let navAppearance = UINavigationBarAppearance()

struct ContentView: View {
    
    init() {
    
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .systemBlue
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
    
    
    @State var listItems:[String] = []
    
    
    var body: some View {
        
       
        
        NavigationView {
            
//            List{
//                ForEach(listItems, id: .\self) { item in
//                    Text("\(item)")
//                }
                    
                    
            Text("Hello, world!")
                        .padding()
                .navigationBarTitle("Todoey", displayMode: .inline)
                
          
        }
      

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

