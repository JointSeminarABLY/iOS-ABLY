//
//  DetailItemCVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/16.
//

import UIKit

class DetailItemCVC: UICollectionViewCell {
    static let identifier = "DetailItemCVC"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    // MARK: - TODO : 나중에 서버 연결하면 가져올 것
    func cellConfigure(image: String,
                       discount: Int,
                       price: String,
                       item: String) {
        itemImageView.image = UIImage(named: image)
        
        discountLabel.text = "\(discount)%"
        priceLabel.text = price
        itemLabel.text = item
    }
}

// MARK: - UI
extension DetailItemCVC {
    private func setUI() {
        setImageView()
        setLabel()
        setButton()
    }
    
    private func setImageView() {
        itemImageView.layer.cornerRadius = 10
    }
    
    private func setLabel() {
        discountLabel.textColor = .ablyRed
        itemLabel.textColor = .ablyGray
        
        discountLabel.font = .boldSystemFont(ofSize: 12)
        priceLabel.font = .boldSystemFont(ofSize: 12)
        itemLabel.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    private func setButton() {
        likeButton.setImage(UIImage(named: "icHeartOutline"), for: .normal)
        likeButton.tintColor = .white
    }
}
