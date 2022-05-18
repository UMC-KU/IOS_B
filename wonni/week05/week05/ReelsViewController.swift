//
//  ReelsViewController.swift
//  week05
//
//  Created by 맥프로 on 2022/05/18.
//

import UIKit

class ReelsViewController: UIViewController {

    
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0 //현재 위치한 페이지
    
    private let videoURLStrArr = ["flower","sea"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    
    //MARK: - Actions
    
    //MARK: - Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
    }
    
    private func startLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in     //2초마다 반복 재생
            self.moveNextPage()
        }
    }
    
    private func moveNextPage() {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage += 1
        if(nowPage >= itemCount) {
            //마지막페이지
            nowPage = 0
        }
        
        collectionView.scrollToItem(
            at: IndexPath(item:nowPage, section: 0),
            at: .centeredVertically,
            animated: true) //collection view가 2초마다 아래로 내려가고, 마지막 페이지면 첫번째 페이지로 넘어감
        
    }

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell()}
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    
    //릴스 메모리 관리
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            //해당 셀에 접근에 성공하면,
            cell.videoView?.cleanup()
        }
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}


