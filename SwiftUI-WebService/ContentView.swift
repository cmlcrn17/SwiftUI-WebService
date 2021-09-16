//
//  ContentView.swift
//  SwiftUI-WebService
//
//  Created by Ceren on 17.06.2020.
//  Copyright © 2020 ceren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let serviceGame = ServiceGame()
    let prefs = UserDefaults.standard
    
    var body: some View {
        VStack{
            Button(action: {
                var resultGamification: ResultGamification?
                let decoder = JSONDecoder()
                
                self.serviceGame.getMethod(userID: 37) { (output) in
                    
                    resultGamification = output
                    
                    if(resultGamification?.status == 200){
                        let sourceData = try! decoder.decode(ResultData.self, from: (resultGamification?.data)!)
                        
                        print("outputStr \(resultGamification?.status)")
                        
                    }else if(resultGamification?.status == 401) //Unauthorized
                    {
                        print("outputStr \(resultGamification?.status)")
                    }else if(resultGamification?.status == 404) //Not Found
                    {
                        print("outputStr \(resultGamification?.status)")
                    }else{
                        print(" ELSE ")
                    }
                }
            }) {
                Text("getMethod")
            }.padding()
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
