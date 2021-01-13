//
//  ArticleSafariViewDelegate.swift
//  Mini-BBC-Sport
//
//  Created by IWAN EVANS on 08/01/2021.
//

import Foundation
import SafariServices

class ArticleSafariViewDelegate: NSObject, SFSafariViewControllerDelegate {
    
    var startTimer = Date()
    let statsManager: StatsManager
    
    init(statsManager: StatsManager) {
        self.statsManager = statsManager
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        
        let endTime = Date()
        
        let timeDifference: Int = Int(endTime.timeIntervalSince(startTimer) * 1000)
        
        if didLoadSuccessfully {
            
            statsManager.sendStat(stat: .success(timeDifference))
            
        } else {
            
            statsManager.sendStat(stat: .failure(timeDifference))
        }
    }
    
    
}
