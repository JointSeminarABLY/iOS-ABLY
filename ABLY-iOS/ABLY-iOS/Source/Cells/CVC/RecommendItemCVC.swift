//
//  RecommendItemCVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/15.
//

import UIKit

class RecommendItemCVC: UICollectionViewCell {
    static let identifier = "RecommendItemCVC"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var thumbupImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - TODO : 나중에 서버 연결하면 가져올 것
    func cellConfigure(image: String,
                       discount: Int,
                       price: String,
                       store: String,
                       item: String,
                       review: Int,
                       satisfaction: Int) {
        itemImageView.image = UIImage(named: image)
        
        discountLabel.text = "\(discount)%"
        priceLabel.text = price
        storeLabel.text = store
        itemLabel.text = item
        reviewLabel.text = "리뷰 \(review) - 만족도 \(satisfaction)% "
    }
}

// MARK: - UI
extension RecommendItemCVC {
    private func setUI() {
        setImageView()
        setLabel()
        setButton()
    }
    
    private func setImageView() {
        itemImageView.layer.cornerRadius = 10
        
        // MARK: - asset 가져온 다음에 넣어주기
        thumbupImageView.image = UIImage(named: "thumb")
    }
    
    private func setLabel() {
        discountLabel.textColor = .ablyRed
        itemLabel.textColor = .ablyGray
        reviewLabel.textColor = .ablyGray
        
        discountLabel.font = .boldSystemFont(ofSize: 12)
        priceLabel.font = .boldSystemFont(ofSize: 12)
        storeLabel.font = .boldSystemFont(ofSize: 8)
        itemLabel.font = .systemFont(ofSize: 8)
        reviewLabel.font = .systemFont(ofSize: 8)
    }
    
    private func setButton() {
        // MARK: - asset 가져온 다음에 넣어주기
        likeButton.setImage(UIImage(named: "like"), for: .normal)
    }
}
