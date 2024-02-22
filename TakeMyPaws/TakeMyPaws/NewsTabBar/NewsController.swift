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
    func showAllNews(newsId: NewsModel) {
        let coordinator = NewsDetailsCoordinator(selectedId: newsId,
                                                 navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    // MARK: - ViewModelConfiguration
    
    func configureViewModel() {
        
        viewModel.getMainNewsDetails()

        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            
            self.mainNewsCollection.reloadData()
        }
    }
    @IBAction func latestNewsViewButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LatestNewsViewAllController") as! LatestNewsViewAllController
        navigationController?.show(controller, sender: nil)
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
        
        cell.cellConfig(title: news.newsEn ?? "", source: "Published by: \(news.publisherName ?? "")", image: news.image ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showAllNews(newsId: viewModel.mainNews[indexPath.item])
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
