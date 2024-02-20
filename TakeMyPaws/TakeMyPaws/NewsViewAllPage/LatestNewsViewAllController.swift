//
//  LatestNewsViewAllController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 12..
//

import UIKit

class LatestNewsViewAllController: UIViewController {
    
    @IBOutlet weak var latestNewsCollection: UICollectionView!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        cellRegister()
    }
    
    
    func configureViewModel() {
        
        viewModel.getLatestNewsDetails()
        
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            
            self.latestNewsCollection.reloadData()
        }
    }
    
    
}

// MARK: - UIConfiguration

extension LatestNewsViewAllController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.latestNews.count
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
        let controller = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsController") as! NewsDetailsController
        controller.selectedNews = viewModel.latestNews[indexPath.item]
        navigationController?.present(controller, animated: true)
    }
}
extension LatestNewsViewAllController {
    func cellRegister() {
        latestNewsCollection.register(UINib(nibName: "LatestNewsCell", bundle: nil), forCellWithReuseIdentifier: "LatestNewsCell")
    }
}
