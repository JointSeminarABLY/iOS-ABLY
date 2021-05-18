//
//  MainTopTVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/16.
//

import UIKit

enum TopItems : String{
    case today
    case new
    case best
    case hotDeal
}


class MainTopTVC: UITableViewCell {
    static public let identifier : String = "MainTopTVC"
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var hamburgerButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var myBagButton: UIButton!
    
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var bestButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var hotDealButton: UIButton!
    
    @IBOutlet weak var todayUnderView: UIView!
    @IBOutlet weak var bestUnderView: UIView!
    @IBOutlet weak var newUnderView: UIView!
    @IBOutlet weak var hotDealUnderView: UIView!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    
    @IBAction func onClickTodayButton(_ sender: Any) {
        selectedTopItem(item: .today)
    }
    
    
    @IBAction func onClickBestButton(_ sender: Any) {
        selectedTopItem(item: .best)
    }
    
    @IBAction func onClickNewButton(_ sender: Any) {
        selectedTopItem(item: .new)
    }
    
    @IBAction func onClickHotButton(_ sender: Any) {
        selectedTopItem(item: .hotDeal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI(){
        logoImageView.image = UIImage(named: "ablyLogo")

        searchTextField.then { 
            $0.placeholder = "원하는 스타일 옷을 검색해보세요"
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = .ablyLightGray
            $0.borderStyle = .none
            $0.layer.cornerRadius = 5.0
            $0.tintColor = .gray
            $0.setLeftIcon(UIImage(systemName: "magnifyingglass")!)
        }
        

        hamburgerButton.setImage(UIImage(named: "hamburger"), for: .normal)
        messageButton.setImage(UIImage(named: "icMessage"), for: .normal)
        myBagButton.setImage(UIImage(named: "icMybag"), for: .normal)
        
        selectedTopItem(item: .today)
        
        mainImageView.image = UIImage(named: "rectangle10")
        
    }
    
    func selectedTopItem(item : TopItems){
        [todayButton,bestButton,newButton,hotDealButton].forEach {
            $0?.setTitleColor(.ablyGray, for: .normal)
            $0?.titleLabel?.font = .boldSystemFont(ofSize: 12)
        }
        [todayUnderView,bestUnderView,newUnderView,hotDealUnderView].forEach {
            $0?.backgroundColor = .ablyGray
        }
        
        switch item {
        case .today:
            todayButton.setTitleColor(.ablyBlack, for: .normal)
            todayUnderView.backgroundColor = .ablyBlack
            
        case .best:
            bestButton.setTitleColor(.ablyBlack, for: .normal)
            bestUnderView.backgroundColor = .ablyBlack
            
        case .new:
            newButton.setTitleColor(.ablyBlack, for: .normal)
            newUnderView.backgroundColor = .ablyBlack
            
        case .hotDeal:
            hotDealButton.setTitleColor(.ablyBlack, for: .normal)
            hotDealUnderView.backgroundColor = .ablyBlack
        }
    }
    
    
}
