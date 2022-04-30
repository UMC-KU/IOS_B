//
//  StoryTableViewCell.swift
//  CatStargram
//
//  Created by 황유란 on 2022/04/10.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //홈컨트롤러의 테이블뷰에서 콜렉션뷰에 바로 접근할 수 없기 때문에 이 함수를 통해 델리게이트를 받아온다
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int){
        collectionView.delegate=dataSourceDelegate
        collectionView.dataSource=dataSourceDelegate //홈컨트롤러의 델리게이트를 받아오기
        collectionView.tag=row
        
        let storyNib=UINib(nibName:"StoryCollectionViewCell",bundle:nil)
        collectionView.register(storyNib,forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        //가로스크ㅗㄹ
        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        flowLayout.sectionInset = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        //스토리간의 간격
        flowLayout.minimumLineSpacing=12
        
        collectionView.collectionViewLayout=flowLayout
        
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
