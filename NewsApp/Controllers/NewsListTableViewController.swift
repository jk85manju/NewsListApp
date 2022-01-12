//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by manju V on 09/01/22.
//  Copyright © 2022 Tcs. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM :ArticleListViewModel!
    let url = URL(string: 
        "https://newsapi.org/v2/everything?q=tesla&from=2021-12-12&sortBy=publishedAt&apiKey=19cfcb523597480495d89a0cb0071bf1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    /**
     Seup function to fetch details from Api and load table
     
     - Parameters:
     - Nil
     
     - Returns:  data Loaded with Title and Description
     */
    
    //MARK:SETUP 
    func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        WebService().getAllList(url: url){articles in
            
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articleList: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    //MARK:Tableview Datasource ad Delegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0:self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(_section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViwCell else {
            fatalError("Not Loaded")
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        let articleVM = self.articleListVM.articleAtIndex(_index: indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
}
