//
//  StatsManager.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 08/01/2021.
//

import Foundation

class StatsManager {
    
    
    
    enum Stat {
        
        case success(Int)
        case failure(Int)
        case tapped(String)
        
        func getFinalURL() -> String {
            
            let rootURL = "https://bbc.github.io/sport-app-dev-tech-challenge/stats?"
            
            switch self {
            
            case .success(let loadTime):
                return rootURL + "event=pageLoadSuccess&data=\(loadTime)"
            case .failure(let loadTime):
                return rootURL + "event=pageLoadFailure&data=\(loadTime)"
            case .tapped(let articleURL):
                 return rootURL + "event=articleTapped&data=\(articleURL)"
            
            
            }
            
        }
        
        
    }
    
    func sendStat(stat: Stat, urlSession: URLSession = URLSession.shared) {
        
        
//        if let requestURL = URL(string: finalURL) {
//
//            let task = URLSession.shared.dataTask(with: requestURL) {(data, response, error) in
//                guard let data = data else { return }
//                print(String(data: data, encoding: .utf8)!)
//
//            }
//            task.resume()
//
//        }
        
        guard let requestURL = URL(string: stat.getFinalURL()) else { return }
        
        let task = urlSession.dataTask(with: requestURL) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            
        }
        task.resume()
        
        
    }
    
    
}
