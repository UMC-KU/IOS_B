//
//  VideoPlayerView.swift
//  week05
//
//  Created by 맥프로 on 2022/05/18.
//

import Foundation
import AVKit
import Alamofire

class VideoPlayerView: UIView {
    
    var playerLayer: AVPlayerLayer?  //재생될때 Layer를 잡아줌, 크기 담당
    var playerLooper: AVPlayerLooper? //반복 재생에 관련
    var queuePlayer: AVQueuePlayer? //먼저 들어온 영상은 먼저 재생, 나중에 들어온 영상은 나중에 재생
    var urlStr: String
    
    init(frame: CGRect, urlStr: String) {
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer?.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play()
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup() {
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
