//
//  NewsPageHeader.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import UIKit

class NewsPageHeader: UICollectionReusableView {
    
    @IBOutlet weak var latestNewsCollection: UICollectionView!
    
    
    override func awakeFromNib() {
        latestNewsCollection.dataSource = self
        latestNewsCollection.delegate = self
        super.awakeFromNib()
        configureViewModel()
        latestNewsCollection.register(UINib(nibName: "LatestNewsCell", bundle: nil), forCellWithReuseIdentifier: "LatestNewsCell")
        print("salam")
    }
    var viewModel = NewsViewModel()
    
    
    // MARK: - ViewModelConfiguration
    
    func configureViewModel() {
        
        viewModel.getLatestNewsDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            print(self.viewModel.latestNews)
            self.latestNewsCollection.reloadData()
        }
    }
    
    @IBAction func RecomendationViewAllBUttonTapped(_ sender: Any) {
    }
}
// MARK: - UIConfiguration
extension NewsPageHeader: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.latestNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestNewsCell", for: indexPath) as! LatestNewsCell
        let news = viewModel.latestNews[indexPath.item]
        cell.latestNewsImage.loadImage(url: news.image ?? "")
        cell.latestNewsTitle.text = news.newsEn
        cell.latestNewsSource.text = "Published by: \(news.publisherName ?? "")"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let newsDetailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsController") as? NewsDetailsController else {
            return
        }
        
        newsDetailsController.selectedNews = viewModel.latestNews[indexPath.item]
        
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(newsDetailsController, animated: true)
        } else {
            
            self.window?.rootViewController?.present(newsDetailsController, animated: true, completion: nil)
        }
    }
}

