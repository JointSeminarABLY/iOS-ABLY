//
//  DetailImageTVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/18.
//

import UIKit

enum SelectedItems : String{
    case info
    case review
    case ask
}


class DetailImageTVC: UITableViewCell {
    public static let identifier = "DetailImageTVC"
    

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var askButton: UIButton!
    
    @IBOutlet weak var infoUnderView: UIView!
    @IBOutlet weak var reviewUnderView: UIView!
    @IBOutlet weak var askUnderView: UIView!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var divderView: UIView!
    
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    @IBAction func onClickInfoButton(_ sender: Any) {
        selectedTopItem(item: .info)
    }
    
    
    @IBAction func onClickReviewButton(_ sender: Any) {
        selectedTopItem(item: .review)
    }
    
    @IBAction func onClickAskButton(_ sender: Any) {
        selectedTopItem(item: .ask)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        selectedTopItem(item: .info)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setUI(){

        moreInfoButton.setBackgroundImage(UIImage(named: "buttonMore1"), for: .normal)
        infoButton.then {
            $0.setTitle("상품정보", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
        }

        reviewButton.then {
            $0.setTitle("리뷰14", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
        }

        askButton.then {
            $0.setTitle("문의/안내", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
        }
        
        divderView.backgroundColor = .ablyLightGray
        
        [infoUnderView,askUnderView,reviewUnderView].forEach {
            $0?.backgroundColor = .ablyBlack
        }
        
        
        bannerImageView.image = UIImage(named: "banner")
        detailImageView.image = UIImage(named: "photoInformation")
        
    }
    
    func selectedTopItem(item : SelectedItems){
        [infoButton,reviewButton,askButton].forEach {
            $0?.setTitleColor(.ablyGray, for: .normal)
        }
        [infoUnderView,reviewUnderView,askUnderView].forEach {
            $0?.backgroundColor = .ablyLightGray
        }
        
        switch item {
        case .info:
            infoButton.setTitleColor(.ablyBlack, for: .normal)
            infoUnderView.backgroundColor = .ablyBlack
            
        case .review:
            reviewButton.setTitleColor(.ablyBlack, for: .normal)
            reviewUnderView.backgroundColor = .ablyBlack
            
        case .ask:
            askButton.setTitleColor(.ablyBlack, for: .normal)
            askUnderView.backgroundColor = .ablyBlack
        }
    }
}
