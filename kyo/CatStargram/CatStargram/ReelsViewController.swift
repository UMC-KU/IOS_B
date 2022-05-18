//
//  ReelsViewController.swift
//  CatStargram
//
//  Created by 황유란 on 2022/05/14.
//

import UIKit

class ReelsViewController: UIViewController {

    //MARK - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage=0
    
    private let videoURLStrArr=["dummyVideo01","dummyVideo02"]
    
    
    //MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    
    //MARK - Action
    
    //MARK - Helpers
    private func setupCollectionView(){
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.decelerationRate = .fast //scroll fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
        
    }
    
    private func startLoop(){
        let _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            self.moveNextPage()
        } //2초마다 반복호출을 하고 그 때마다 다음페이지로 넘어감
    }
    
    private func moveNextPage(){
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage+=1
        if(nowPage>=itemCount){
            //마지막 페이지면 다시 처음으로
            nowPage=0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .centeredVertically, animated: true)
    }
}

extension ReelsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell=collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
        
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
}
extension ReelsViewController :UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //세로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //보여주기가 완료된 동영상은 재생종료해라
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell=collectionView.cellForItem(at: indexPath) as? ReelsCell{
            cell.videoView?.cleanup()
        }
    }
}
