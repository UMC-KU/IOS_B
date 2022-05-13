//
//  ProfileViewController.swift
//  practice
//
//  Created by 유탁 on 4/29/22.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - PROPERTIES
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPost]? {
        didSet { self.profileCollectionView.reloadData() }
    }
    
    var deletedIndex: Int?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
        
        setUpData()

    }
    
    //MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != .began { return }
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
            print("삭제합니다 ",indexPath.item)
            
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            
            if let postIdx = cellData.postIdx {
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }

        }
            
    }
    
    
    //MARK: - Helpers
    private func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.7
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
        
    }
    
    private func setUpData() {
        UserFeedDataManager().getUserFeed(self)
    }
}

//MARK: - Profile view
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileCollectionViewCell.identifier,
                for: indexPath) as? ProfileCollectionViewCell else {
                    return UICollectionViewCell()
                }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCollectionViewCell.identifier,
                for: indexPath) as? PostCollectionViewCell else {
                    return UICollectionViewCell()
                }
            
            if let cellData = self.userPosts {
                cell.setUpData(cellData[indexPath.item].postImgUrl)
            }

            return cell
        }
        
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width,
                          height: CGFloat(159))
        default:
            let side = CGFloat((collectionView.frame.width - 4) / 3)
            return CGSize(width: side,
                          height: side)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}


//MARK: - API 통신
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
