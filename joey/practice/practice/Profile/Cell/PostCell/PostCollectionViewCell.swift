//
//  PostCollectionViewCell.swift
//  practice
//
//  Created by 유탁 on 4/29/22.
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
    
    public func setUpData(_ imageURLString: String?) {
        
        guard let imageURLString = imageURLString else { return }
        if let url = URL(string: imageURLString) {
            postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    
    }

}
