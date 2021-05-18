//
//  CategoryItemCVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

class CategoryItemCVC: UICollectionViewCell {

    static public let idenetifier : String = "CategoryItemCVC"
    
    @IBOutlet weak var itemButton: AblyCategoryButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setData(text : String){
        itemButton.setTitle(text, for: .normal)
    }

    override func prepareForReuse() {
        itemButton.setTitle("", for: .normal)
    }
}
