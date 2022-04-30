//
//  ProfileViewController.swift
//  CatStargram
//
//  Created by 황유란 on 2022/04/11.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let catstagram=UIImage(named:"ic_catstagram_logo")
        
        let imageButton=UIBarButtonItem(image: catstagram, target: self, action: nil)
        navigationBar.topItem?.setLeftBarButton(<#T##UIBarButtonItem?#>, animated: <#T##Bool#>) leftBarButtonItem=imageButton
        
        navigationBar.image
        // Do any additional setup after loading the view.
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
