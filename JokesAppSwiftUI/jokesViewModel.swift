//
//  jokesViewModel.swift
//  JokesAppSwiftUI
//
//  Created by Bartu Kara on 28.07.2023.
//

import Foundation
import Alamofire

class JokesViewModel : ObservableObject{
    
    @Published var jokes = [Value]() // publish ediyoruz cunku content view içerisinde gözlemleyebiliyoruz.
    
    init(){
        getJokes()
    }
    
    func getJokes() {
        
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json",method: .get).responseDecodable(of:Welcome.self) {response in
            
            switch response.result{
            
            case .success(let data):
                print(data)
                let value = data.value
                self.jokes += value
            case .failure(let error):
                print(error)
            }
            
            
        }
        
        
    }
    
    
}


//https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json
