//
//  SignUpViewController.swift
//  practice
//
//  Created by 유탁 on 3/25/22.
//

import UIKit

class SignupViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var fullName: String = ""
    var userName: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    
    var isValidEmail = false {
        didSet { //property Observer
            self.validateUserInfo()
        }
    }
    var isValidFullName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidUserName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var textFields: [UITextField] {
        [emailTextfield, fullNameTextField, userNameTextField, passwordTextField]
    }
    
    //Textfields
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var backToLoginViewButton: UIButton!
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        //for bug gix = can swipe
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChange(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextfield:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case fullNameTextField:
            self.isValidFullName = text.count > 2
            self.fullName = text
        case userNameTextField:
            self.isValidUserName = text.count > 2
            self.userName = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Sign Up TextField Error")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: email,
                                fullName: fullName,
                                userName: userName,
                                password: password)
        
        self.userInfo?(userInfo)
    }
    
    
    
    
    // MARK: - Helpers
    private func setupTextField() {
        textFields.forEach { textField in
            textField.addTarget(self, action: #selector(textFieldEditingChange(_:)), for: .editingChanged)
        }
    }
    
    private func validateUserInfo() {
        
        if isValidEmail && isValidFullName && isValidUserName && isValidPassword {
            
            UIView.animate(withDuration: 0.3) {
                self.signupButton.isEnabled = true
                self.signupButton.backgroundColor = UIColor(named: "facebook")
            }
            
           } else {
               UIView.animate(withDuration: 0.3) {
                   self.signupButton.isEnabled = false
                   self.signupButton.backgroundColor = UIColor(named: "disabledButton")
               }
        }
    }
    
    private func setupAttribute() {
        //signUp Button
        
        let text1 = "Have an account?"
        let text2 = "Sign up"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.lightGray
        let color2 = UIColor(named: "facebook") ?? UIColor.lightGray
        
        let attributes = generateButtonAttribute(
            self.backToLoginViewButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.backToLoginViewButton.setAttributedTitle(attributes, for: .normal)
    }
    

}


extension String {
    
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidation = NSPredicate.init(format: "SELF MATCHES %@", emailRegularExpression)
        
        return emailValidation.evaluate(with: self)
    }
}
