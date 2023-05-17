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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            if let scrollView = self.view.viewWithTag(1) as? UIScrollView {
                scrollView.contentSize = CGSize(width: size.width, height: size.height)
            }
        }, completion: nil)
    }
    
    @IBAction func seeMoreButtonClicked(_ sender: Any) {
        if let news = news, let url = URL(string: news.url!) {
                let safariVC = SFSafariViewController(url: url)
                present(safariVC, animated: true, completion: nil)
            }
    }
    @IBAction func addFavorites(_ sender: Any) {
//        if !FavoritesVC.news.contains(titleLabel.text!){
//            FavoritesVC.news.append(authorLabel.text!)
//            FavoritesVC.news.append(detailList!)
//            FavoritesVC.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//
//        }
//        else{
//            let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this from favorites ?", preferredStyle: .alert)
//
//            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
//                if let index = LikedViewController.likes.firstIndex(of: self.detailList!) {
//                    LikedViewController.likes.remove(at: index)
//                }
//                if let index = LikedViewController.gameNames.firstIndex(of: self.nameLabel.text!) {
//                    LikedViewController.gameNames.remove(at: index)
//                }
//                self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//            })
//
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
//            }
//
//            dialogMessage.addAction(ok)
//            dialogMessage.addAction(cancel)
//
//            self.present(dialogMessage, animated: true, completion: nil)
//
//        }
    }
    
}
