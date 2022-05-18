//
//  TabBarController.swift
//  TabBarCustom
//
//  Created by 이민아 on 2022/05/04.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let controller1 = UIViewController()
        controller1.view.backgroundColor = .blue
        controller1.tabBarItem.image = UIImage(systemName: "heart")
        controller1.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        
        let controller2 = UIViewController()
        controller2.view.backgroundColor = .lightGray
        
        let controller3 = UIViewController()
        controller3.view.backgroundColor = .brown
        controller3.tabBarItem.image = UIImage(systemName: "person")
        controller3.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        viewControllers = [controller1, controller2, controller3]
        
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
            let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
            var menuButtonFrame = menuButton.frame
            menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
            menuButton.frame = menuButtonFrame

            menuButton.backgroundColor = UIColor.white
            menuButton.layer.cornerRadius = menuButtonFrame.height/2
            view.addSubview(menuButton)

            menuButton.setImage(UIImage(systemName: "flag"), for: .normal)
            menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

            view.layoutIfNeeded()
        }


        // MARK: - Actions

        @objc private func menuButtonAction(sender: UIButton) {
            selectedIndex = 1
        }


}
