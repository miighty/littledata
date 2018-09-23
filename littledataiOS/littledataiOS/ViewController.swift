//
//  ViewController.swift
//  littledataiOS
//
//  Created by Ricardo Mighty on 23/09/2018.
//  Copyright © 2018 Ricardo Mighty. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: UIImage(named: "Littledata")!,
                           title: "Take control",
                           description: "Health care data monetisation",
                           pageIcon:  UIImage(named: "key")!,
                           color: UIColor(red: 72/255, green: 0, blue: 106/255, alpha: 0.80),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage(named: "Security")!,
                           title: "Protect your digital identity",
                           description: "Create a unique I.D only identifiable to you",
                           pageIcon: UIImage(named: "key")!,
                           color: UIColor(red: 72/255, green: 0, blue: 106/255, alpha: 0.84),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage(named: "Identity")!,
                           title: "Secure",
                           description: "Storing hashes on the blockchain using IPFS with your and you give companies direct access to your data",
                           pageIcon: UIImage(named: "key")!,
                           color: UIColor(red: 72/255, green: 0, blue: 106/255,alpha: 0.88),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipButton.isHidden = true

        navigationController?.setNavigationBarHidden(true, animated: false)
        setupPaperOnboardingView()
        view.bringSubview(toFront: skipButton)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

extension ViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }
    
    func onboardingDidTransitonToIndex(_: Int) {
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
    }
}

// MARK: PaperOnboardingDataSource
extension ViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
}

//MARK: Constants
extension ViewController {
    
    private static let titleFont = UIFont(name: "OpenSans-Bold", size: 20.0) ?? UIFont.boldSystemFont(ofSize: 20.0)
    private static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}

