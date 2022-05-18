//
//  StoryCollectionViewCell.swift
//  CatStargram
//
//  Created by 황유란 on 2022/04/10.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView! //스토리 전체
    @IBOutlet weak var viewUserProfileBackground: UIView! //스토리 테투리
    @IBOutlet weak var imageViewUserProfile: UIImageView! //프로필 이미지
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius=viewUserProfileBackground.frame.width/2
        viewUserProfileBackground.layer.cornerRadius=23.5
        imageViewUserProfile.layer.cornerRadius=22.5
        imageViewUserProfile.clipsToBounds=true
        // Initialization code
    }

}
