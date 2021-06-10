//
//  ScrollcardCollectionViewCell.swift
//  ABLY-iOS
//
//  Created by 한울 on 2021/06/07.
//

import UIKit

class ScrollcardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    func setData(imageName : String, state : String, description :String)
    {
        if let image = UIImage(named: imageName)
        {
            productImageView.image = image
        }
        stateLabel.text = state
        descriptionLabel.text = description
    }
    
    func setView() {
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
                
        layer.masksToBounds = false
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
    }

}
