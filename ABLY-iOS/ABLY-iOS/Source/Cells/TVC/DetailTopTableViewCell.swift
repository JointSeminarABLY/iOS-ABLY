//
//  DetailTopTableViewCell.swift
//  ABLY-iOS
//
//  Created by 한울 on 2021/05/21.
//

import UIKit

class DetailTopTableViewCell: UITableViewCell {
    public static let identifier = "DetailTopTableViewCell"

    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTitlePriceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    
    
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
