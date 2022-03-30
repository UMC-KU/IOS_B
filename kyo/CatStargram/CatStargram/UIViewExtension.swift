//
//  UIViewExtension.swift
//  CatStargram
//
//  Created by 황유란 on 2022/03/27.
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
    
    @IBInspectable var shadowOffset: CGSize{ //모서리를 부드럽게
        get{
            return layer.shadowOffset
        }
        set{
            layer.masksToBounds=false
            layer.shadowOffset=newValue
        
        }
    }
    
    @IBInspectable var shadowOpacity: Float{ //모서리를 부드럽게
        get{
            return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity=newValue
        }
    }
  
}
