//
//  MainNewsViewAllController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 12..
//

import UIKit

class MainNewsViewAllController: UIViewController {

    @IBOutlet weak var mainNewsCollection: UICollectionView!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        cellRegister()
    }
    
    func configureViewModel() {
        
        viewModel.getMainNewsDetails()
        
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            
            self.mainNewsCollection.reloadData()
        }
    }
}

// MARK: - UIConfiguration

extension MainNewsViewAllController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.mainNews.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainNewsCell", for: indexPath) as! MainNewsCell
        let news = viewModel.mainNews[indexPath.item]
        cell.newsImage.loadImage(url: news.image ?? "")
        cell.newsSource.text = news.publisherName
        cell.newsTitle.text = news.newsEn
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsController") as! NewsDetailsController
        controller.selectedNews = viewModel.mainNews[indexPath.item]
        navigationController?.present(controller, animated: true)
    }
}

extension MainNewsViewAllController {
    func cellRegister() {
        mainNewsCollection.register(UINib(nibName: "MainNewsCell", bundle: nil), forCellWithReuseIdentifier: "MainNewsCell")
    }
}
