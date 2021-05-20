//
//  Extension+UITextField.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/18.
//

import UIKit


extension UITextField {
 func setLeftIcon(_ icon: UIImage) {

    let padding = 12
    let width = 10
    let height = 9

    let outerView = UIView(frame: CGRect(x: 0, y: 0, width: width+padding+13, height: height) )
    let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: width, height: height))
    iconView.image = icon
    outerView.addSubview(iconView)

    leftView = outerView
    leftViewMode = .always
  }
}

