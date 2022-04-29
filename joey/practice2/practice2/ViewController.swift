//
//  ViewController.swift
//  practice2
//
//  Created by 유탁 on 4/5/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = UILabel()
        title.text = "Instagram"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: title)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        // Do any additional setup after loading the view.
    }
    
}


