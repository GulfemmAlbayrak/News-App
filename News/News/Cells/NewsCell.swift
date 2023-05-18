//
//  NewsCell.swift
//  News
//
//  Created by Gülfem Albayrak on 16.05.2023.
//

import UIKit
import NewsAPI
import SDWebImage

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        authorLabel.text = nil
        newsImage.image = nil
    }
    
    func configure(news: News) {
        design()
        titleLabel.text = news.title
        authorLabel.text = news.byline
        if let multimedia = news.multimedia?.first, let url = URL(string: multimedia.url!) {
                newsImage.sd_setImage(with: url)
            } else {
                newsImage.image = nil
            }
    }
    
    func design(){
        newsImage.layer.cornerRadius = 3
    }
    
}
