//
//  ArticleData.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 06/01/2021.
//

import Foundation

struct APIData {
    let url = "https://bbc.github.io/sport-app-dev-tech-challenge/data.json"
}

struct FullArticleData: Decodable{
    let data: ArticleData
    
}

struct ArticleData: Decodable {
    let topic : [String: String]
    let items: [Items]
}

struct Items: Decodable {
    let title : String
    let url : String
    let lastUpdatedTimestamp : Int
    let image : Image
}

struct Image: Decodable {
    let small: URL
}

struct Articles {
    let articles = [Items]()
}
