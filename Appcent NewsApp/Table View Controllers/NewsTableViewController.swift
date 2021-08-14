//
//  NewsTableViewController.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 10.08.2021.
//

import UIKit
import Alamofire

class NewsTableViewController: UITableViewController , UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var arr : [Article]? = []
    var filteredData: [Article] = []
    var pageNo: Int = 1
    var isLoadingStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        
        //let parameters = ["q":"%20", "page": "1", "apiKey":"06c2318ea4c64504b48b3d126168203c"]
        
        
        let parameters = ["q":"saliha", "page": "\(pageNo)", "apiKey":"06c2318ea4c64504b48b3d126168203c"]
        
        let url = "https://newsapi.org/v2/everything"
        
        
        AF.request(url, method: .get, parameters: parameters) .responseJSON { (res) in
            
            if(res.response?.statusCode == 200) {
                
                let news = try? JSONDecoder().decode(News.self, from: res.data!)
                self.arr = news?.articles
                self.tableView.reloadData()
                
                print("kaç sonuç var?",news?.totalResults as Any)
                
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(filteredData.count > 0) {
            return filteredData.count
        } else {
            return arr!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        let item: Article
        if filteredData.count > 0 {
            item = filteredData[indexPath.row]
        } else {
            item = arr![indexPath.row]
        }
        DispatchQueue.main.async {
            let url = URL(string: item.urlToImage!)
            let data = try! Data(contentsOf: url!)
            cell.newsImage.image = UIImage(data: data)
        }
        
        cell.newsTitle.text = item.title
        cell.newsAbout.text = item.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sender: Article
        if filteredData.count > 0 {
            sender = filteredData[indexPath.row]
        }
        else {
            sender = arr![indexPath.row]
        }
        performSegue(withIdentifier: "detail", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "detail" ) {
            let vc = segue.destination as! DetailViewController
            vc.item = (sender as! Article)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""{
            filteredData = arr!
        }
        else{
            for item in arr!{
                if item.title!.lowercased().contains(searchText.lowercased()){
                    filteredData.append(item)
                }
            }
        }
        
        self.tableView.reloadData()
        
    }
    
    //    Pagination
    
    //    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    //
    //      print("scrollViewWillBeginDragging")
    //      isLoadingStarted = false
    //    }
    //
    //
    //
    //    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //      print("scrollViewDidEndDecelerating")
    //    }
    //
    //    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //
    //        print("scrollViewDidEndDragging")
    //        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
    //        {
    //            if !isLoadingStarted{
    //                isLoadingStarted = true
    //                pageNo += 1
    //            }
    //            tableView.reloadData()
    //            isLoadingStarted = false
    //        }
    //    }
}




