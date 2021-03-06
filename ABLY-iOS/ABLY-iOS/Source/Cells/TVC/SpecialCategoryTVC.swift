//
//  SpecialCategoryTVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit
import SnapKit

class SpecialCategoryTVC: UITableViewCell {
    public static let identifier : String = "SpecialCategoryTVC"
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var eventButton: AblyCategoryButton!
    @IBOutlet weak var cosmeticButton: AblyCategoryButton!
    @IBOutlet weak var homeDecoButton: AblyCategoryButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI(){
        messageLabel.text = "김솝트님, 원하시는 특별 카테고리를 선택해보세요"
        messageLabel.font = .boldSystemFont(ofSize: 12)
        
        eventButton.then{
            $0.categoryType = .special
            $0.setUI()
            $0.setTitle("이벤트", for: .normal)
        }
        cosmeticButton.then{
            $0.categoryType = .special
            $0.setUI()
            $0.setTitle("코스메틱", for: .normal)
        }
        homeDecoButton.then{
            $0.categoryType = .special
            $0.setUI()
            $0.setTitle("홈데코", for: .normal)
        }
        
    }
}
