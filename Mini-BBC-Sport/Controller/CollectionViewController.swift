//
//  CollectionViewController.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 21/12/2020.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var topicHeaderContainer: UIView!
    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    let splashView = UIView()
    let launchImage = UIImageView(image: UIImage(named: "BBC_Sport_2017")!)
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
    
        topicCollectionView.layer.cornerRadius = 5.0
        topicCollectionView.layer.shadowOpacity = 0.2
        topicCollectionView.layer.shadowOffset = CGSize(width: 2, height: 1)
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 3.0, execute: {
            self.performSegue(withIdentifier: "toSplashScreen", sender: nil)
            
        })
        
        splashView.backgroundColor = UIColor.systemYellow
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        launchImage.contentMode = .scaleAspectFit
        splashView.addSubview(launchImage)
        launchImage.frame = CGRect(x: splashView.frame.midX - 35, y: splashView.frame.midY - 35, width: 70, height: 70)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.scaleDownAnimation()
        }
    }
    
    func scaleDownAnimation() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.launchImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }) { (succes) in
            self.scaleUpAnimation()
        }
    }
    
    //MARK: Scale up animation
    
    func scaleUpAnimation() {
        
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.launchImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) {  (success) in
            self.splashView.removeFromSuperview()
        }
        
    }
    
    func removeSplashScreen() {
        
        splashView.removeFromSuperview()
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["Football ⚽️", "Formula 1 🏎", "Rugby 🏉", "Golf 🏌🏻‍♂️", "Cricket 🏏", "NBA 🏀", "Olympics 🏅", "Hockey 🏒", "Tennis 🎾", "Athletics 🏃🏻‍♀️"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.topicTitle.text = self.items[indexPath.row] // The row value is the same as the index of the desired text within the array.
        cell.backgroundColor = UIColor.white // make cell more visible in our example project
        cell.layer.cornerRadius = 5.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 2, height: 1)
        cell.accessibilityTraits = UIAccessibilityTraits.button
        

        
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 100.0, height: 100.0)
        }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "toFormula1", sender: nil)
        }
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.yellow
    }

    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 15)
        }
}



  


