//
//  NewsDetailVC.swift
//  News
//
//  Created by Gülfem Albayrak on 16.05.2023.
//
import SafariServices
import CoreData
import NewsAPI
import UIKit

class NewsDetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var sectionLabel: UILabel!
    
    var news: News?
    var favoriteNews: [News] = []
    
    var isLikeButtonFilled: Bool = false
    var isNewsInLiked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsImage.layer.cornerRadius = 12
        seeMoreButton.layer.cornerRadius = 6
        seeMoreButton.clipsToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showDetail()
    }
    
    private func showDetail() {
        if let news = news {
            titleLabel.text = news.title
            abstractLabel.text = news.abstract
            authorLabel.text = news.byline
            sectionLabel.text = news.section
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            if let publishedDate = news.publishedDate {
                let formattedDate = DateFormatters.mediumStyleFormatter().string(from: publishedDate)
                publishedDateLabel.text = formattedDate
            } else {
                publishedDateLabel.text = ""
            }
            
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
    
    @IBAction func seeMoreButtonClicked(_ sender: Any) {
        if let news = news, let url = URL(string: news.url!) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func addFavorites(_ sender: Any) {
        if let news = news {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let context = appDelegate.persistentContainer.viewContext
            
            // Check if the news is already in favorites
            let newsIsInFavorites = checkNewsIsInFavorites()
            
            if newsIsInFavorites {
                // Remove the news from favorites
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteNews")
                fetchRequest.predicate = NSPredicate(format: "favNewsTitle == %@", news.title ?? "")
                fetchRequest.fetchLimit = 1
                
                do {
                    let result = try context.fetch(fetchRequest)
                    if let favoriteNewsItem = result.first as? NSManagedObject {
                        context.delete(favoriteNewsItem)
                        try context.save()
                        print("Favorite news item removed")
                    }
                } catch let error as NSError {
                    print("Failed to remove favorite news item: \(error), \(error.userInfo)")
                }
            } else {
                // Add the news to favorites
                let favoriteNewsEntity = NSEntityDescription.entity(forEntityName: "FavoriteNews", in: context)
                let favoriteNews = NSManagedObject(entity: favoriteNewsEntity!, insertInto: context)
                
                favoriteNews.setValue(news.multimedia?.first?.url, forKey: "favNewsImage")
                favoriteNews.setValue(titleLabel.text, forKey: "favNewsTitle")
                favoriteNews.setValue(authorLabel.text, forKey: "favNewsAuthor")
                
                do {
                    try context.save()
                    print("Favorite news item saved")
                } catch let error as NSError {
                    print("Failed to save favorite news item: \(error), \(error.userInfo)")
                }
            }
            
            // Toggle the filled and empty heart icon
            isLikeButtonFilled = !isLikeButtonFilled
            
            if isLikeButtonFilled {
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    private func checkNewsIsInFavorites() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteNews")
        fetchRequest.predicate = NSPredicate(format: "favNewsTitle == %@", news?.title ?? "")
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try context.fetch(fetchRequest)
            return !result.isEmpty
        } catch {
            print("Failed to fetch favorite news items: \(error)")
            return false
        }
        
    }
    
}
