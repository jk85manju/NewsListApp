//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by manju V on 09/01/22.
//  Copyright © 2022 Tcs. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articleList : [Article]
    
}

extension ArticleListViewModel{
    var numberOfSections:Int{
        return 1
    }
    
    func numberOfRowsInSection(_section:Int) -> Int {
        return self.articleList.count
    }
    
    func articleAtIndex(_index:Int) -> ArticleViewModel {
        let article = self.articleList[_index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel{
    private let article:Article
}
extension ArticleViewModel{
    init(_ article:Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title:String{
        return self.article.title
    }
    
    var description:String{
        return self.article.description
    }
}
