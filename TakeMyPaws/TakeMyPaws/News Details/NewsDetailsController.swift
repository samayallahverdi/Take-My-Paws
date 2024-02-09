//
//  NewsDetailsController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 09..
//

import UIKit

class NewsDetailsController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var publisherImage: UIImageView!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var newsDescription: UITextView!
    
    
    var selectedNews: NewsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
      configureUI()
    }
    
    func configureUI() {
        newsImage.loadImage(url: selectedNews?.image ?? "")
        newsTitle.text = selectedNews?.newsEn
        publisherName.text = selectedNews?.publisherName
        publisherImage.loadImage(url: selectedNews?.publisherImage ?? "")
        newsDescription.text = selectedNews?.descriptionEn
        
    }

}
