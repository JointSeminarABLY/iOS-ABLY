//
//  TabbarController.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/15.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
        setTabBar()
    }
    
    func setupStyle() {
        UITabBar.appearance().tintColor = UIColor.ablyRed
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
    
    func setTabBar(){
        
        
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeTab = homeStoryboard.instantiateViewController(identifier: "HomeNavi")
        homeTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icHome"), selectedImage: UIImage(named: "icHome"))
        
        let styleTab = homeStoryboard.instantiateViewController(identifier: "VC")
        styleTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icStyle"), selectedImage: UIImage(named: "icStyle"))
        
        let marketTab = homeStoryboard.instantiateViewController(identifier: "VC")
        marketTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icMarket"), selectedImage: UIImage(named: "icMarket"))
        
        let likeTab = homeStoryboard.instantiateViewController(identifier: "VC")
        likeTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icLove"), selectedImage: UIImage(named: "icLove"))
        
        let mypageTab = homeStoryboard.instantiateViewController(identifier: "VC")
        mypageTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icMypage"), selectedImage: UIImage(named: "icMypage"))

        let tabs =  [homeTab, styleTab, marketTab, likeTab, mypageTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
}
