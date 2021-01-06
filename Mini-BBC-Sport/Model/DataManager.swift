//
//  DataManager.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 15/12/2020.
//

import Foundation

class DataManager {
    
    var articleInfo = [Items]()

//    init() {
//        performRequest()
//    }

    //MARK:Perform JSON Request
    func performRequest(completion: @escaping ()->()) {
        
        if let dataURL = URL(string: "https://bbc.github.io/sport-app-dev-tech-challenge/data.json") {
            URLSession.shared.dataTask(with: dataURL) { data, response, error in
                if error != nil {
                    print(error as Any)
                }
                if let safeData = data {
                   
                    self.parseJSON(JSONdata: safeData)
                    completion()
                }
            
                }.resume()
            }
        }
    
    
    //MARK:Parse JSON
    func parseJSON(JSONdata: Data) {
        
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(FullArticleData.self, from: JSONdata)

            articleInfo = decodedData.data.items
            
        } catch {
           print(error)
        }
        
    }
    
    
}



