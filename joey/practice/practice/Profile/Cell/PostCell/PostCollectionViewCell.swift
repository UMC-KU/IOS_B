//
//  PostCollectionViewCell.swift
//  practice
//
//  Created by 유탁 on 4/29/22.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUpData() {
        
    }

}
