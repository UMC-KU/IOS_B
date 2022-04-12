//
//  SecondViewController.swift
//  practice2
//
//  Created by 유탁 on 4/5/22.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textfield: UITextField!
    var previousViewController: ViewController?
    
    @IBAction func button2(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    
    func doChange() {
        previousViewController?.label.text = self.textfield.text
    }
    
}
