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

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var askButton: UIButton!
    
    @IBOutlet weak var infoUnderView: UIView!
    @IBOutlet weak var reviewUnderView: UIView!
    @IBOutlet weak var askUnderView: UIView!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var divderView: UIView!
    
    
    
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setUI(){
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
        
        bannerImageView.image = UIImage(named: "")
        detailImageView.image = UIImage(named: "")
        
    }
    
    func selectedTopItem(item : SelectedItems){
        [infoButton,reviewButton,askButton].forEach {
            $0?.setTitleColor(.ablyGray, for: .normal)
        }
        [infoUnderView,reviewUnderView,askUnderView].forEach {
            $0?.backgroundColor = .ablyGray
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
