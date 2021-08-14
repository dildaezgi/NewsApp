//
//  WebViewViewController.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 12.08.2021.
//

import UIKit
import WebKit
import Alamofire

class WebViewViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    

    var item: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("item" , item as Any)
                        
        self.webView.navigationDelegate = self
        let url = URL(string: item.url!)
        let req = URLRequest(url: url!)
        webView.load(req)
                   
            }
        }
       
