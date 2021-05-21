//
//  HomeVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/15.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var homeTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setHomeVC()
    }
    
    func registerXib(){
        let topNib = UINib(nibName: MainTopTVC.identifier, bundle: nil)
        homeTV.register(topNib, forCellReuseIdentifier: MainTopTVC.identifier)
        
        let specialCategoryNib = UINib(nibName: SpecialCategoryTVC.identifier, bundle: nil)
        homeTV.register(specialCategoryNib, forCellReuseIdentifier: SpecialCategoryTVC.identifier)
        
        let fashionCategoryNib = UINib(nibName: FashionCategoryTVC.identifier, bundle: nil)
        homeTV.register(fashionCategoryNib, forCellReuseIdentifier: FashionCategoryTVC.identifier)
        
        let mainRecommendItemNib = UINib(nibName: MainRecommendItemTVC.identifier, bundle: nil)
        homeTV.register(mainRecommendItemNib, forCellReuseIdentifier: MainRecommendItemTVC.identifier)
        
        let mainHotRankNib = UINib(nibName: MainHotRankTVC.identifier, bundle: nil)
        homeTV.register(mainHotRankNib, forCellReuseIdentifier: MainHotRankTVC.identifier)
        
        
    }
}

extension HomeVC: UITableViewDelegate{
    func setHomeVC(){
        homeTV.delegate = self
        homeTV.dataSource = self
        homeTV.allowsSelection = false
        homeTV.separatorStyle = .none
        homeTV.estimatedRowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0,1,2:
            return UITableView.automaticDimension
        case 3:
            return 1585
        case 4:
            return 243
        default:
            return UITableView.automaticDimension
        }
        
    }
}

extension HomeVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  MainTopTVC.identifier, for: indexPath) as? MainTopTVC else {return UITableViewCell()}

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  SpecialCategoryTVC.identifier, for: indexPath) as? SpecialCategoryTVC else {return UITableViewCell()}

            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  FashionCategoryTVC.identifier, for: indexPath) as? FashionCategoryTVC else {return UITableViewCell()}
            cell.delegate = self
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  MainRecommendItemTVC.identifier, for: indexPath) as? MainRecommendItemTVC else {return UITableViewCell()}
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  MainHotRankTVC.identifier, for: indexPath) as? MainHotRankTVC else {return UITableViewCell()}
            
            return cell
           
        default:
            return UITableViewCell()
        }
    }
    
}

extension HomeVC : FoldingProtocol{
    func reloadTV() {
        self.homeTV.reloadData()
    }
}
