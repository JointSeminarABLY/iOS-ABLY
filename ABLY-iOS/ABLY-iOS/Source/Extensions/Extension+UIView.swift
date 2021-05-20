//
//  Extension+UIView.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

extension UIView : Then {}
public protocol Then {}

extension Then where Self  : Any {
    public func then(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}


extension UIView{
    func addSubviews(_ views:UIView...){
        for view in views {
            self.addSubview(view)
        }
    }
}
