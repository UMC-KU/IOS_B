//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by 이민아 on 2022/05/04.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPost]?{
        didSet { self.profileCollectionView.reloadData()}
    }
    
    var deletedIndex: Int?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupData()
        
    }
    //MARK: -Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state != .began { return } //방어코드
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position){
            print("DEBUG: ", indexPath.item)
            
            guard let userPosts = self.userPosts else {return}
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx {
                //삭제 API를 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
       
        }
    }
    
    
    //MARK: -Helpers
    private func setupCollectionView(){
        //delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell 등록
        profileCollectionView.register(UINib(nibName:"ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        profileCollectionView.register(UINib(nibName:"PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
    }
    private func setupData(){
        UserFeedDataManager().getUserFeed(self)
    }

}

//MARK: -CollectionViewDelegate, DataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    //section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //cell의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    //cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패...")
            }
            return cell
        default: //Post
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패...")
            }
            let itemIndex = indexPath.item
            
            if let cellData = self.userPosts{ //데이터가 있는 경우, 셀에 데이터를 전달
                cell.setupData(cellData[itemIndex].postImgUrl)
            }
            
            return cell
        }
        
    }
    
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(157))
        default:
            let side = CGFloat((collectionView.frame.width/3)-(4/3))
            return CGSize(width: side, height: side)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

//MARD: API 통신
extension ProfileViewController{
    func sucessAPI(_ result: UserFeedModel){
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool){
        guard isSuccess else {return}
        
        if let deletedIndex = self.deletedIndex{
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}

