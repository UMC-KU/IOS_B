//
//  LoginViewController.swift
//  practice
//
//  Created by 유탁 on 3/25/22.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.isValidEmail() ? UIColor(named: "facebook") : UIColor(named: "disabledButton")
        self.email = text
    }
    
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.count > 0 ? UIColor(named: "facebook") : UIColor(named: "disabledButton")
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 = textField
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! UITabBarController
        self.view.window?.windowScene?.keyWindow?.rootViewController = vc
//        guard let userInfo = self.userInfo else { return }
//        if (userInfo.email == self.email && userInfo.password == self.password) {
//            let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! UITabBarController
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
//        } else {
//            print("로그인 실패")
//        }
        
    }
    
    @IBOutlet weak var forgotPasswordButton: UILabel!
    
    
    @IBAction func signUpButtonDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupViewController
        
//        self.present(signupViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(signupViewController, animated: true)
        
        signupViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        //signUp Button
        
        let text1 = "Don't have an account?"
        let text2 = "Sign up"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.lightGray
        let color2 = UIColor(named: "facebook") ?? UIColor.lightGray
        
        let attributes = generateButtonAttribute(
            self.signupButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.signupButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
