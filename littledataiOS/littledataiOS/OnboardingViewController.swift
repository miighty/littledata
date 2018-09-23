//
//  OnboardingViewController.swift
//  littledataiOS
//
//  Created by Ricardo Mighty on 23/09/2018.
//  Copyright © 2018 Ricardo Mighty. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var OnboardingImage: UIImageView!
    var count = 0

    override func viewWillAppear(_ animated: Bool) {
       OnboardingImage.bounds = UIScreen.main.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        OnboardingImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        OnboardingImage.addGestureRecognizer(tap)
    }
    
    @objc func changeImage(_ sender: UITapGestureRecognizer) {
        count += 1
        
        if count == 1 {
        OnboardingImage.image = UIImage(named: "2OB")
        } else if count == 2 {
        OnboardingImage.image = UIImage(named: "3OB")
        } else if count == 3 {
            performSegue(withIdentifier: "OBToLoginSegue", sender: self)
        }
    }

}
