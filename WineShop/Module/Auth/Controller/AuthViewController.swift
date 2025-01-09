//
//  AuthController.swift
//  WineShop
//
//  Created by Kostyan on 10.01.2023.
//

import UIKit

protocol AuthViewInput: AnyObject {
    
}

class AuthViewController: BaseViewController<AuthView> {
    
    var output: AuthViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
        //init states for elemets
        mainView.logInButton.isEnabled = false
        
        //delegates
        mainView.loginTextField.delegate = self
        mainView.passwordTextField.delegate = self
        
        //actions
        mainView.logInButton.addTarget(self, action:
            #selector(logInButtonPressed), for: .touchUpInside)
        mainView.forgetButton.addTarget(self, action: #selector(forgetButtonPressed), for: .touchUpInside)
        mainView.signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func updateLoginButtonState(){
        if !(mainView.loginTextField.text == nil || mainView.loginTextField.text!.isEmpty) && !(mainView.passwordTextField.text == nil || mainView.passwordTextField.text!.isEmpty){
            mainView.logInButton.isEnabled = true
        } else {
            mainView.logInButton.isEnabled = false
        }
    }
    
    @objc func logInButtonPressed(){
        print("logIn")
    }
    
    @objc func forgetButtonPressed(){
        print("forget")
    }
    
    @objc func signInButtonPressed(){
        let view = TabBarViewController()
        self.navigationController?.pushViewController(view, animated: true)
        print("sigIn") 
    }

}

extension AuthViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateLoginButtonState()
    }
}

extension AuthViewController: AuthViewInput {
    
}
