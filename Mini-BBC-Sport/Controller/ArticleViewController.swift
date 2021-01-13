//
//  ArticleViewController.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 15/12/2020.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var registerOutlet: UIButton!
    @IBOutlet weak var dismissOutlet: UIButton!
    
    
    override func viewDidLoad() {
        
        signInOutlet.layer.cornerRadius = 5.0
        registerOutlet.layer.cornerRadius = 5.0
        signInOutlet.layer.shadowOpacity = 0.2
        registerOutlet.layer.shadowOpacity = 0.2
        signInOutlet.layer.shadowOffset = CGSize(width: 2, height: 1)
        registerOutlet.layer.shadowOffset = CGSize(width: 2, height: 1)
        dismissOutlet.accessibilityIdentifier = "skip-button"
        
       
        
    }
    @IBAction func dismissSplashScreen(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    
}

