//
//  ViewController.swift
//  Protocol
//
//  Created by 황유란 on 2022/04/02.
//

import UIKit

protocol ChangeLabelDelegate{
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoToNextVC(_ sender: Any) {
        guard let nextVC=storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else{
            return
            
        }
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.previousViewController=self
        present(nextVC,animated: true,completion: nil)
    
    }
    
    var delegate:ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

