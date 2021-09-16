//
//  ServiceGame.swift
//  SwiftUI-WebService
//
//  Created by Ceren Taşsın on 13.08.2021.
//  Copyright © 2021 ceren. All rights reserved.
//

import Foundation

struct ServiceGame{
    
    let servicePath = "http://url"
    let token = "Bearer Token"
    
    
    //MARK Product Catch
    
    func getMethod(userID: Int, dataString: @escaping (ResultGamification?) -> Void) -> Void
    {
        var request = URLRequest(url: URL(string: "\(servicePath)\(userID)")!,timeoutInterval: Double.infinity)
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        var result: Bool! = false
        let semaphore = DispatchSemaphore(value: 0)
        
        _ = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data else { return }
            
            let httpStatus = response as? HTTPURLResponse
            print("StatusCode \(httpStatus!.statusCode)")
            
            var resultGamification = ResultGamification(status: httpStatus!.statusCode, data: data)
            print("resultGamification \(resultGamification)")
            
            result = true
            semaphore.signal()
            dataString(resultGamification)
            
        }.resume()
        
        semaphore.wait()
    }
    
    func putMethod(userID: Int, gameId: Int, dataString: @escaping (ResultGamification?) -> Void) -> Void
    {
        var request = URLRequest(url: URL(string: "\(servicePath)\(userID)")!,timeoutInterval: Double.infinity)
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "PUT"
        
        var dateComponents = DateComponents()
        let calculateDate = Calendar.current.date(byAdding: dateComponents, to: Date())
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormattingUseDate = dateformat.string(from: calculateDate! as Date)
        let gameEndDate = dateFormattingUseDate
        print("Date \(gameEndDate)")
        
        let dic = [

            "gameId":"\(gameId)",

            "endDate":"\(gameEndDate)",
            
        ]
        
        var jsonData:Data?
        do {
            jsonData = try JSONSerialization.data(

                withJSONObject: dic,

                options: .prettyPrinted)

        } catch {
            print(error.localizedDescription)
        }
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8",forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        print("Request \(request)")
        
        var result: Bool! = false
        let semaphore = DispatchSemaphore(value: 0)
        
        _ = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data else { return }
            
            let httpStatus = response as? HTTPURLResponse
            print("StatusCode \(httpStatus!.statusCode)")
           
            var resultGamification = ResultGamification(status: httpStatus!.statusCode, data: data)
            print("resultGamification \(resultGamification)")
            
            result = true
            semaphore.signal()
            dataString(resultGamification)
            
        }.resume()
        
        semaphore.wait()
    }
    
    func postMethod(userID: Int, dataString: @escaping (ResultGamification?) -> Void) -> Void
    {
        var request = URLRequest(url: URL(string: "\(servicePath)\(userID)")!,timeoutInterval: Double.infinity)
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        var result: Bool! = false
        let semaphore = DispatchSemaphore(value: 0)
        
        _ = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data else { return }
            
            let httpStatus = response as? HTTPURLResponse
            print("StatusCode \(httpStatus!.statusCode)")
            
            var resultGamification = ResultGamification(status: httpStatus!.statusCode, data: data)
           print("resultGamification \(resultGamification)")
            
            result = true
            semaphore.signal()
            dataString(resultGamification)
            
        }.resume()
        
        semaphore.wait()
    }
}
