//
//  RegisterViewController.swift
//  CatStargram
//
//  Created by 황유란 on 2022/03/27.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: - Properties
    var email:String=""
    var name:String=""
    var nickname:String=""
    var password:String=""
    
    var userInfo: ((UserInfo) -> Void)? //익명함수? 클로져? 인터페이스처럼 사용하는 용도인듯
    
    var isValidEmail=false{
        didSet{ //프로퍼티 옵저버
            //변수에 값이 setting이 되면 이 코드를 실행하겠다는 의미
            self.validateUserInfo()
        }
    }
    var isValidName=false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidNickname=false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidPassword=false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
   
    @IBOutlet weak var popToLoginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
  
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var signupButton: UIButton!
    
    var textFields: [UITextField]{
        [emailTextField,nameTextField,nicknameTextField,passwordTextField]
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate=nil //네비게이션 컨트롤러가 가지고 있어서 막혀있는걸 풀어주는 것인 듯
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Actions
    
    @objc
    func textFieldEditingChaned(_ sender:UITextField){
        
        let text=sender.text ?? ""
        
        switch sender{
        case emailTextField:
            self.isValidEmail=text.isValidEmail()
            self.email=text
            
        case nameTextField:
            self.isValidName=text.count>2
            self.name=text
            
        case nicknameTextField:
            self.isValidNickname=text.count>2
            self.nickname=text
            
        case passwordTextField:
            self.isValidPassword=text.isValidPassword()
            self.password=text
            
        default:
            fatalError("Missing TextField..")
        }
        
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo=UserInfo(email:self.email,name:self.name,nickname:self.nickname,password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    //MARK: - Helpers property와 method 연결
    private func setupTextField(){
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChaned(_:)), for: .editingChanged)
        }
    }
    
    //회원정보 유효성 검사 --> 버튼 색깔 업데이트
    private func validateUserInfo(){
        if (isValidEmail && isValidName && isValidNickname && isValidPassword){
            
            self.signupButton.isEnabled=true
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = .facebookColor
            }
        }
        else{
            //유효성검사 -> 유효하지 않음
            self.signupButton.isEnabled=false
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = .disabledButtonColor
            }
        }
    }
    
    private func setupAttribute(){
        let text1="계정이 있으신가요?"
        let text2="로그인"
        
        let font1=UIFont.systemFont(ofSize: 13)
        let font2=UIFont.boldSystemFont(ofSize: 13)
        
        let color1=UIColor.darkGray
        let color2=UIColor.facebookColor
        
        let attributes=generateButtonAttribute(self.popToLoginButton, texts: text1,text2, fonts: font1,font2, colors: color1,color2)
        
        self.popToLoginButton.setAttributedTitle(attributes,for:.normal)
    }
    
}

//정규표현식
extension String{
    //대문자, 소문자, 특수문자, 숫자 8자 이상일 때, -> True
    func isValidPassword() -> Bool{
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation=NSPredicate.init(format:"SELF MATCHES %@",regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 포함 & 2글자 이상인지
    func isValidEmail() -> Bool{
        let emailRegEx="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest=NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
