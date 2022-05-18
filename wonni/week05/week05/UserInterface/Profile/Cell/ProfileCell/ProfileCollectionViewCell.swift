//
//  ProfileCollectionViewCell.swift
//  week05
//
//  Created by 맥프로 on 2022/05/11.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"


    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        
    }
    
    private func setupAttribute() {
        // 코드로 둥글게 만들어주는 작업
        profileImageView.layer.cornerRadius = 88/2
        addProfileImageView.layer.cornerRadius = 24/2
        

        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 5
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        //게시글, 팔로워, 팔로잉에 랜덤 값 부여
        [postingCountLabel, followerCountLabel, followingCountLabel].forEach{$0.text = "\(Int.random(in: 0...10))"}
    }

}
