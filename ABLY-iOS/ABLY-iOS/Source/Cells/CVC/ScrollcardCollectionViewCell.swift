//
//  ScrollcardCollectionViewCell.swift
//  ABLY-iOS
//
//  Created by 한울 on 2021/06/07.
//

import UIKit

class ScrollcardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

}
