//
//  HomeTableViewCell.swift
//  practice3
//
//  Created by 유탁 on 4/13/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellAddressTime: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellIcon1: UIImageView!
    @IBOutlet weak var cellMessageLabel: UILabel!
    @IBOutlet weak var cellIcon2: UIImageView!
    @IBOutlet weak var cellHeartLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 5
        cellImage.clipsToBounds = true
        cellMessageLabel.text = "16"
        cellHeartLabel.text = "150"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
