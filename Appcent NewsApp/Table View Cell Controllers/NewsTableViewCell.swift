//
//  NewsTableViewCell.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 10.08.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsAbout: UITextView!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
