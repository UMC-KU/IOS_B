//
//  SecondViewController.swift
//  Protocol
//
//  Created by 황유란 on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController ,ChangeLabelDelegate{
    func doChange() {
        previousViewController?.label.text=self.textField.text
    }

    @IBOutlet weak var textField: UITextField!
    var previousViewController:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate=self
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
