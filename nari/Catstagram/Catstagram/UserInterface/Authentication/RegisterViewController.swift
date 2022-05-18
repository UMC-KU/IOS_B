//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 이민아 on 2022/03/30.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo)->Void)?
    
    //유효성검사
    var isValidEmail = false{
        didSet{
            self.validateUSerInfo()
        }
    }
    
    var isValidName = false{
        didSet{
            self.validateUSerInfo()
        }
    }
    
    var isValidNickname = false{
        didSet{
            self.validateUSerInfo()
        }
    }
    
    var isValidPassword = false{
        didSet{
            self.validateUSerInfo()
        }
    }
    
    @IBOutlet weak var SignupButton: UIButton!
    
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    
    //Textfields
   
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField]{
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    
    //MARK - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
       setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController? .interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    //MARK - Actions : 코드로 구성
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isVaildEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
        
    }
    
    //MARK - Helpers : 연결
    private func setupTextField(){
        
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }//for문
        
        /* emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for:  .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for:  .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for:  .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for:  .editingChanged) */ //연산프로퍼티로 줄임
         
    }
    private func validateUSerInfo(){
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword{
            
            self.SignupButton.isEnabled = true
            UIView.animate(withDuration: 0.33){
            self.SignupButton.backgroundColor = UIColor(named: "facebookColor")
            }
        } else {
            self.SignupButton.isEnabled = false
            UIView.animate(withDuration: 0.33){
            self.SignupButton.backgroundColor = UIColor(named:"disabledButtonColor")
            }
        }
    }
    
    private func setupAttribute(){
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(named: "facebookColor")!
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
    
    
}


//정규표현식
extension String{ //기능확장
    //대문자, 소문자, 특수문자, 숫자 있는지 확인. 8자이상일때 -> True
    func isValidPassword() -> Bool{
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])(A-Za-z\\d$@$!%*?&]{8,}"
        let passwordVaildation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordVaildation.evaluate(with: self)
    }
    //@포함하고 있는지 , 2글자
    func isVaildEmail()-> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

