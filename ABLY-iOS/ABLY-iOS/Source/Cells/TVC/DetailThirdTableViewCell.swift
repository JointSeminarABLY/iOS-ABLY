//
//  DetailThirdTableViewCell.swift
//  ABLY-iOS
//
//  Created by 한울 on 2021/05/21.
//

import UIKit

class DetailThirdTableViewCell: UITableViewCell {
    

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var deliveryinformationLabel: UILabel!
    @IBOutlet weak var deliveryfeeLavel: UILabel!
    @IBOutlet weak var deliveryperiodLabel: UILabel!
    @IBOutlet weak var deliveryperiodpercentLabel: UILabel!
    @IBOutlet weak var firstpercentLabel: UILabel!
    @IBOutlet weak var firstpercentcontentLabel: UILabel!
    @IBOutlet weak var secondpercentLabel: UILabel!
    @IBOutlet weak var secondpercentcontentLabel: UILabel!
    @IBOutlet weak var thirdpercentLabel: UILabel!
    @IBOutlet weak var thirdpercentcontentLabel: UILabel!
    public static let identifier = "DetailThirdTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView() {
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
}
