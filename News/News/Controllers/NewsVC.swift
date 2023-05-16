//
//  ViewController.swift
//  News
//
//  Created by Gülfem Albayrak on 16.05.2023.
//
import UIKit
import NewsAPI

class NewsVC: UIViewController, LoadingShowable {
    
    @IBOutlet weak var tableView: UITableView!
    
    let service: NewsServiceProtocol = NewsService()
    private var news: [News] = []
    
    override func viewWillAppear(_ animated: Bool) {
        showLoading()
        fetcNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadLogo()
        LoadingView.shared.configure()
        
    }
    
    fileprivate func fetcNews() {
        self.showLoading()
        service.getTopNews { [weak self ] response in
            guard let self else { return }
            self.hideLoading()
            switch response {
            case .success(let news):
                self.news = news
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("API request failed with error: \(error)")
            }
        }
        
    }
    
    
    private func loadLogo() {
        if let logo = UIImage(named: "nyt_logo") {
            let newLogo = Util.app.resizeImageWithAspect(image: logo, scaledToMaxWidth: 250, maxHeigth: 2)
            let imageView = UIImageView(image: newLogo)
            self.navigationItem.titleView = imageView
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
}


extension NewsVC: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsResult = self.news[indexPath.row]
        cell.configure(news: newsResult)
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetailVC = storyboard?.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        newsDetailVC.news = news[indexPath.row]
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
}
