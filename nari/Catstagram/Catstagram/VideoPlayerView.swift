//
//  VideoPlayerView.swift
//  Catstagram
//
//  Created by 이민아 on 2022/05/18.
//

import UIKit
import AVKit

class VideoPlayerView: UIView{
    
    var playerLayer: AVPlayerLayer? //레이어크기
    var playerLooper: AVPlayerLooper? //반복재생
    var queuePlayer: AVQueuePlayer? //동영상순서
    var urlStr: String
    
    init(frame: CGRect, urlStr: String){
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        queuePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup(){
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
