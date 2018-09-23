//
//  ProfileViewController.swift
//  littledataiOS
//
//  Created by Ricardo Mighty on 23/09/2018.
//  Copyright © 2018 Ricardo Mighty. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var count = 0
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBarController?.tabBar.frame

        tabFrame?.size.height = 4
        tabFrame?.origin.y = self.view.frame.size.height - 4
        self.tabBarController?.tabBar.frame = tabFrame!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
//        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1

        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func changeImage(_ sender: UITapGestureRecognizer) {
        count += 1
        
        if count == 1 {
            imageView.image = UIImage(named: "Company")
        } else if count == 2 {
            imageView.image = UIImage(named: "Breakdown")
        }
    }
    
}
