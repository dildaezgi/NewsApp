//
//  FavoriteTableViewController.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 12.08.2021.
//

import UIKit
import Alamofire

class FavoriteTableViewController: UITableViewController {


    var item: Article!
    var arr : [Article]? = []
    var favArr: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favArr.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath) as! FavoriteTableViewCell

        
    
        let url = URL(string: item.urlToImage!)
        let data = try! Data(contentsOf: url!)
        cell.fImage.image = UIImage(data: data)
        cell.fTitle.text = item.title
        cell.fDetail.text = item.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detail", sender: item)
        
    }

}
