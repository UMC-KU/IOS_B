//
//  ReelsCell.swift
//  CatStargram
//
//  Created by 황유란 on 2022/05/14.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell:UICollectionViewCell{
    static let identifier="ReelsCell"
    
    var videoView:VideoPlayerView?
    
    //릴스 타이틀
    let cellTitleLable=UILabel()
    
    //카메라
    let cameraImageView=UIImageView()
    
    //comment
    let commentImageView=UIImageView()
    
    //like
    let likeImageView=UIImageView()
    
    //share
    let shareImageView=UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr:String){
        self.videoView=VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute(){
        cellTitleLable.text="릴스"
        cellTitleLable.font = .boldSystemFont(ofSize: 25)
        cellTitleLable.textAlignment = .left
        cellTitleLable.textColor = .white
        
        [cameraImageView,shareImageView,commentImageView, likeImageView].forEach {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        cameraImageView.image=UIImage(systemName: "camera")
        shareImageView.image=UIImage(systemName: "paperplane")
        commentImageView.image=UIImage(systemName: "message")
        likeImageView.image=UIImage(systemName: "suit.heart")

    }
    
    private func setupLayout(){
        guard let videoView = videoView else {
            return
        }
        
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        [cellTitleLable,cameraImageView,likeImageView,commentImageView,shareImageView].forEach{contentView.addSubview($0)}
        
        cellTitleLable.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        let size=CGFloat(35)
        
        cameraImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(size)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(size)
        }
        
        let space=CGFloat(-20)
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(size)
        }
        
        likeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(size+CGFloat(5))
        }
    }
}
