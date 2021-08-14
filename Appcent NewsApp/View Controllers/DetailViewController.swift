//
//  DetailViewController.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 11.08.2021.
//

import UIKit
import Alamofire
import Lottie

class DetailViewController: UIViewController {
    
    var item: Article!
    
    var arr: [Article] = []
    
    var favArr: [Article] = []
    
    let animation = Animation.named("favorites")
    let animationView = AnimationView()
    
    
    @IBOutlet weak var dAuthor: UILabel!
    
    @IBOutlet weak var dTitle: UILabel!
    
    @IBOutlet weak var dImage: UIImageView!
    
    @IBOutlet weak var dDate: UILabel!
    
    @IBOutlet weak var dAbout: UITextView!
    
    @IBAction func btnWebview(_ sender: Any) {
        
        performSegue(withIdentifier: "goWeb", sender: item)
        
    }
    
    
    
    @IBAction func btnFav(_ sender: UIBarButtonItem) {
        
        print("favoriler ekleme butonuna basıldı")
        
        animationView.frame = CGRect(x: 0, y: 268, width: 400 , height: 400)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
        view.addSubview(animationView)
        
    
            
        }

    
    @IBAction func btnShare(_ sender: UIBarButtonItem) {
        
        let items = [URL(string: item.url!)]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: item.urlToImage!)
        let data = try! Data(contentsOf: url!)
        dImage.image = UIImage(data: data)
        
        dTitle.text = item.title
        dAbout.text = item.description
        dDate.text = item.publishedAt
        dAuthor.text = item.author
        
//        dImage.layer.cornerRadius = 5
//        dImage.clipsToBounds = true
//
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "goWeb" ) {
            let vc = segue.destination as! WebViewViewController
            vc.item = (sender as! Article)
        }
        
    }
    
}
