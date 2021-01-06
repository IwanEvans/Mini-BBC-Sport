//
//  ArticleCell.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 16/12/2020.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleBubble: UIView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articleBubble.layer.cornerRadius = 5.0
        articleBubble.layer.shadowOpacity = 0.2
        articleBubble.layer.shadowOffset = CGSize(width: 2, height: 1)
        articleBubble.backgroundColor = UIColor.systemYellow
        
        Label.isAccessibilityElement = true
        Label.accessibilityHint = "Title of article"
        
        articleImage.isAccessibilityElement = true
        articleImage.accessibilityHint = "Image related to the article"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Items) {
        
        URLSession.shared.dataTask(with: item.image.small, completionHandler: { (data, _, error) in
            DispatchQueue.main.async {
                if let data = data {
                    if let downloadedImage = UIImage(data: data) {
                        self.articleImage.image = downloadedImage
                    }
                }
            }
        }).resume()
        
        Label.text = item.title
        Label.accessibilityValue = item.title
        
    }
    
}
//MARK: can be deleted

//extension UIImageView {
//    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
//        self.image = nil
//        //If imageurl's imagename has space then this line going to work for this
//        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        if let url = URL(string: imageServerUrl) {
//            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
//                //print("RESPONSE FROM API: \(response)")
//                if error != nil {
//                    print("ERROR LOADING IMAGES FROM URL: \(error!)")
//                    DispatchQueue.main.async {
//                        self.image = placeHolder
//                    }
//                    return
//                }
//                DispatchQueue.main.async {
//                    if let data = data {
//                        if let downloadedImage = UIImage(data: data) {
//                            self.image = downloadedImage
//                        }
//                    }
//                }
//            }).resume()
//        }
//    }
//}
