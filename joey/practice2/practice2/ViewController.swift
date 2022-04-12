//
//  ViewController.swift
//  practice2
//
//  Created by 유탁 on 4/5/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var delegate : ChangeLabelDelegate?
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func button1(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
}

protocol ChangeLabelDelegate {
    func doChange()
}

