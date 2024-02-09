//
//  NewsController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import UIKit

class NewsController: UIViewController {

    @IBOutlet weak var mainNewsCollection: UICollectionView!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        cellRegister()
    }
    
    // MARK: - ViewModelConfiguration
    
    func configureViewModel() {
        
        viewModel.getMainNewsDetails()
//        viewModel.getLatestNewsDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            
            self.mainNewsCollection.reloadData()
        }
    }
    @IBAction func latestNewsViewButtonTapped(_ sender: Any) {
    }
    
}
// MARK: - UIConfiguration
extension NewsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.mainNews.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainNewsCell", for: indexPath) as! MainNewsCell
        let news = viewModel.mainNews[indexPath.item]
        cell.newsImage.loadImage(url: news.image ?? "")
        cell.newsSource.text = "Published by: \(news.publisherName ?? "")"
        cell.newsTitle.text = news.newsEn
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsController") as! NewsDetailsController
        controller.selectedNews = viewModel.mainNews[indexPath.item]
        navigationController?.present(controller, animated: true)
    }
}
extension NewsController {
    func cellRegister() {
        mainNewsCollection.register(UINib(nibName: "MainNewsCell", bundle: nil), forCellWithReuseIdentifier: "MainNewsCell")
        mainNewsCollection.register(UINib(nibName: "\(LatestNewsCell.self)", bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "\(LatestNewsCell.self)")
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NewsPageHeader", for: indexPath) as! NewsPageHeader
      
        return headerView
    }
}
