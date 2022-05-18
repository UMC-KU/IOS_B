//
//  UIViewExtension.swift
//  week05
//
//  Created by 맥프로 on 2022/04/13.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{ //모서리를 부드럽게
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius=newValue
            layer.masksToBounds=newValue>0
        }
    }
    

  
}
