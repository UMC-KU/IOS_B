//
//  ReelsViewController.swift
//  Catstagram
//
//  Created by 이민아 on 2022/05/18.
//

import UIKit

class ReelsViewController: UIViewController {
    // MARK: -Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowpage = 0
    
    private let videoURLStrArr = ["Video Of Funny Cat", "Little Kitten Playing His Toy Mouse"]
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

        
    }
    
    //MARK: -Actions
    
    
    //MARK: Helpers
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
     
    }
    
    private func startLoop(){
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){ _ in
            self.moveNextPage()
        }
    }
    
    private func moveNextPage(){
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowpage += 1
        if (nowpage >= itemCount){
            //마지막페이지
            nowpage = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item:nowpage, section: 0), at: .centeredVertically, animated: true)
    }

}

//MARK:-UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            12
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup() //메모리관리
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
