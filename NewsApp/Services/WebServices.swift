//
//  Service.swift
//  MVVMSampleManju
//
//  Created by manju V on 07/12/21.
//  Copyright © 2021 Tcs. All rights reserved.
//

import Foundation
public class WebService{
    /**
     Fetch News Api
     
     - Parameters:
     - Nil
     
     - Returns: News Articles data with Title and Description
     */
    
    func getAllList(url:URL,completion: @escaping ([Article]? )->()){
        URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                print(data)
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if articleList != nil{
                    completion(articleList?.articles)
                }
            }
            }.resume()
        
    }
}
