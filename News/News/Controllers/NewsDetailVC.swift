//
//  NewsDetailVC.swift
//  News
//
//  Created by Gülfem Albayrak on 16.05.2023.
//
import NewsAPI
import UIKit
import SafariServices

class NewsDetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    var news: News?
    
    override func viewWillAppear(_ animated: Bool) {
        if let news = news {
            titleLabel.text = news.title
            abstractLabel.text = news.abstract
            authorLabel.text = news.byline
            //publishedDateLabel.text = news.publishedDate
                if let multimedia = news.multimedia, !multimedia.isEmpty, let url = URL(string: multimedia[0].url!) {
                    DispatchQueue.global(qos: .userInitiated).async {
                        do {
                            let data = try Data(contentsOf: url)
                            DispatchQueue.main.async {
                                self.newsImage.image = UIImage(data: data)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seeMoreButton.layer.cornerRadius = 6
        seeMoreButton.clipsToBounds = true

    }
    @IBAction func seeMoreButtonClicked(_ sender: Any) {
        if let news = news, let url = URL(string: news.url!) {
                let safariVC = SFSafariViewController(url: url)
                present(safariVC, animated: true, completion: nil)
            }
    }
   
}
