//
//  News.swift
//  NewsApp
//
//  Created by manju V on 09/01/22.
//  Copyright © 2022 Tcs. All rights reserved.
//

import Foundation

struct ArticleList:Decodable {
    let articles:[Article]
    
}
struct Article:Decodable {
    let title :String
    let description:String
}
