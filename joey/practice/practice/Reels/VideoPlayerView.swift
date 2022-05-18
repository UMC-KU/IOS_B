//
//  VideoPlayerView.swift
//  practice
//
//  Created by 유탁 on 5/17/22.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {
    
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?
    var URLStr: String
    
    init(frame: CGRect, URLStr: String) {
        self.URLStr = URLStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: URLStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
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
