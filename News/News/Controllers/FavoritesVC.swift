//
//  FavoritesVC.swift
//  News
//
//  Created by Gülfem Albayrak on 17.05.2023.
//
import CoreData
import NewsAPI
import UIKit


class FavoritesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteNews: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FavoriteNewsCell", bundle: nil), forCellReuseIdentifier: "FavoriteNewsCell")
    }
   
    
  
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteNewsCell", for: indexPath) as! FavoriteNewsCell
        let news = favoriteNews[indexPath.row]
        //cell.configure(news: news)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçili hücreye tıklandığında yapılacak işlemleri buraya ekleyin
    }
}
