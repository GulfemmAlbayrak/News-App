//
//  FavoriteNewsCell.swift
//  News
//
//  Created by Gülfem Albayrak on 17.05.2023.
//

import UIKit
import NewsAPI
import SDWebImage

class FavoriteNewsCell: UITableViewCell {

    @IBOutlet weak var favNewsImage: UIImageView!
    @IBOutlet weak var favTitleLabel: UILabel!
    @IBOutlet weak var favAuthorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    
//    func configure(news: FavoriteNews) {
//        favTitleLabel.text = favNewsIfavTmage.title
//        favAuthorLabel.text = news.byline
//
//        if let multimedia = news.multimedia?.first, let url = URL(string: multimedia.url!) {
//                favNewsImage.sd_setImage(with: url)
//            } else {
//                favNewsImage.image = nil
//            }
//    }
}
