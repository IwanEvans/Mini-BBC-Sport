//
//  ViewController.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 15/12/2020.
//

import UIKit
import SafariServices
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
  
    //MARK:Outlets and variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shareButton: UIButton!
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    let defaults = UserDefaults.standard
    var clickedArticleCellURL : String = ""
    var urlArray = [String]()
    
    var dataManager = DataManager()
    
    @IBAction func sharePressed(_ sender: UIButton) {
        
        let text = URL(string: "https://www.bbc.co.uk/sport/formula1")
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    //MARK:viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()

        dataManager.performRequest {
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                self.tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "myCell")
                self.userNotificationCenter.delegate = self
                self.requestNotificationAuthorization()
                self.sendNotification()

                let loadURLsArray = self.defaults.stringArray(forKey: "SavedURLs") ?? [String]()
                print("\(loadURLsArray)")
            }
        }
    }
    
    //MARK:viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    //MARK:viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    
    
    func requestNotificationAuthorization() {
        
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    //MARK:Notifications
    func sendNotification() {
        
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "Liverpool Win Premier League"
        notificationContent.body = "Man utd relegated..."
        notificationContent.badge = NSNumber(value: 1)
        
        if let url = Bundle.main.url(forResource: "BBC_Sport_2017", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "BBC_Sport_2017",
                                                              url: url,
                                                              options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
    
}

extension ViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.articleInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? ArticleCell
        let article = dataManager.articleInfo[indexPath.row]
        cell?.configure(item: article)
        cell?.articleImage.image = #imageLiteral(resourceName: "Formula 1 icon")
        cell?.backgroundColor = UIColor.white
        cell?.accessibilityTraits = UIAccessibilityTraits.button
        
        return cell!
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("button was tapped")
        
        clickedArticleCellURL = dataManager.articleInfo[indexPath.row].url
        
        if let url = URL(string: "\(clickedArticleCellURL)") {
            
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
            
            let tappedEndpoint = URL(string: "https://bbc.github.io/sport-app-dev-tech-challenge/stats?event=articleTapped&data=\(clickedArticleCellURL)")!
            
            //here i need to get the loadtime as a variable from the API call and pass that into the url
            //let loadedEndpoint = URL(string: "https://bbc.github.io/sport-app-dev-tech-challenge/stats? //event=pageLoadSuccess&data=loadTime")!
            
            let task = URLSession.shared.dataTask(with: tappedEndpoint) {(data, response, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
                
            }
            //
            //            let loadTask = URLSession.shared.dataTask(with: loadedEndpoint) {(data, response, error) in
            //                guard let data = data else { return }
            //                print(String(data: data, encoding: .utf8)!)
            //            }
            task.resume()
            //loadTask.resume()
        }
        
    }
    
}
