//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by 이민아 on 2022/03/30.
//

import UIKit

extension UIView{
    @IBInspectable var conrnerRadius: CGFloat{ //모따기
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
