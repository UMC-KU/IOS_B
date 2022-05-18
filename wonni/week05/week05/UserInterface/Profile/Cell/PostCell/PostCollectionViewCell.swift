//
//  PostCollectionViewCell.swift
//  week05
//
//  Created by 맥프로 on 2022/05/11.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    public func setUpData(_ imageURLStr : String?) {
        //이미지뷰의 이미지를 업로드한다.
        
        guard let imageURLStr = imageURLStr else {return}
        if let url = URL(string: imageURLStr) {
            postImageView.kf.setImage(
                with: url,
                placeholder : UIImage(systemName: "photo"))
        }
    }
}
