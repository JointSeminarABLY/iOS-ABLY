//
//  Extension+UIStackView.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

extension UIStackView{
    func addArrangedSubviews(_ views:UIView...){
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
