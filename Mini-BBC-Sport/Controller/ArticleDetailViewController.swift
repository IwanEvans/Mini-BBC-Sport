//
//  ArticleDetailViewController.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 16/12/2020.
//

import Foundation
import UIKit
import SafariServices
import WebKit

class ArticleDetailViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var clickedArticleURL : String = ""
    
    override func viewDidLoad() {
        print("Article URL: \(clickedArticleURL)")
        //displayArticle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //displayArticle()
    }
    
//    func displayArticle() {
//
//        let urlString = "\(clickedArticleURL)"
//
//        if let url = URL(string: urlString) {
//            let vc = SFSafariViewController(url: url)
//            vc.delegate = self
//
//            present(vc, animated: true)
//        }
//
//    }
//
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        dismiss(animated: true)
//    }
    
    let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
        getArticle()
    }
    
    func getArticle() {
        
        if let url = URL(string: "\(clickedArticleURL)") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    

    
}
