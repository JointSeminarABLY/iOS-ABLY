//
//  AblyCategoryButton.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

enum CategoryType {
    case special
    case fashion
}

class AblyCategoryButton: UIButton {
    public var categoryType: CategoryType!
    
    public init(colorType: CategoryType) {
        super.init(frame: .zero)
        self.categoryType = colorType
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI(){
        titleLabel?.font = UIFont.systemFont(ofSize: 12,weight: .medium)
        
        layer.masksToBounds = true
        layer.cornerRadius = 47.0
        
        switch categoryType{
        case .special:
            backgroundColor = .ablyMediumGray
            setTitleColor(.ablyWhite, for: .normal)
        
        case .fashion:
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.ablyBlack.cgColor
            setTitleColor(.ablyBlack, for: .normal)
            
        default:
            break
        }
        
    }
}

