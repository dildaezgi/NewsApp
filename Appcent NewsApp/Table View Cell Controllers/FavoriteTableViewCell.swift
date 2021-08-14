//
//  FavoriteTableViewCell.swift
//  Appcent NewsApp
//
//  Created by Dilda Ezgi Metincan on 12.08.2021.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fTitle: UILabel!
    
    @IBOutlet weak var fDetail: UITextView!
    
    @IBOutlet weak var fImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
