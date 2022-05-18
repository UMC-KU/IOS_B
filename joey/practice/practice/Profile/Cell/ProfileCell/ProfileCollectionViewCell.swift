//
//  ProfileCollectionViewCell.swift
//  practice
//
//  Created by 유탁 on 4/29/22.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var countPosting: UILabel!
    @IBOutlet weak var countFollower: UILabel!
    @IBOutlet weak var countFollowing: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        // Initialization code
    }

    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 44
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        addProfileImageView.layer.cornerRadius = 12
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        [countPosting, countFollower, countFollowing]
            .forEach { $0.text = "\(Int.random(in: 0...100))" }
    }
    
}
