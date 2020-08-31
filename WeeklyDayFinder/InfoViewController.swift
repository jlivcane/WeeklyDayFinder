//
//  InfoViewController.swift
//  WeeklyDayFinder
//
//  Created by jekaterina.livcane on 26/08/2020.
//  Copyright © 2020 jekaterina.livcane. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    var infoText = String()
    let appDescText = "This app is homework project.\nWhich day of the week is your day?\nCheck Dark/Light Mode."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDescriptionLabel.text = appDescText
        
        if !infoText.isEmpty{
            appInfoLabel.text = infoText
        }
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("dismiss View Controller")
    }
    
    
    
}
