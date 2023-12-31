//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Bartu Kara on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView {
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }
            .toolbar {
                Button(action: addJoke) {
                    Text("Get New Joke")
                }
            }
            .navigationTitle(Text("JOKES APP"))
        }
    }
    
    func addJoke(){
        jokesVM.getJokes()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
