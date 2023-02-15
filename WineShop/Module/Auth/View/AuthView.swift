//
//  AuthView.swift
//  WineShop
//
//  Created by Kostyan on 10.01.2023.
//

import UIKit
import SnapKit

class AuthView: BaseView {
    
    private let wineLabel: UILabel = {
        let label = UILabel()
        label.text = "Wine House"
        label.font = R.font.philosopherRegular(size: 40)
        
        return label
    }()
    
    private let smalLabel: UILabel = {
        let label = UILabel()
        label.text = "est. 1920"
        label.font = R.font.montserratRegular(size: 12)
        
        return label
        
    }()
    
     let forgetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = R.font.montserratRegular(size: 12)
        button.setTitleColor(R.color.textDefault(), for: .normal)
       
        return button
        
    }()
    
     let loginTextField: StyledTextField = {
        let textField = StyledTextField()
        textField.font = R.font.montserratRegular(size: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "Номер телефона", attributes: [NSAttributedString.Key.foregroundColor: R.color.textInput()!])
        textField.backgroundColor = R.color.whiteAlpha01()
        
        
        
        return textField
    }()
    
     let passwordTextField: StyledTextField = {
        let textField = StyledTextField()
        textField.font = R.font.montserratRegular(size: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: R.color.textInput()!])
        textField.backgroundColor = R.color.whiteAlpha01()
        
        return textField
    }()
    
     let logInButton: StyledButton = {
        let button = StyledButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = R.font.montserratRegular(size: 14)
        button.setBackgroundColor(color: R.color.buttonDisable()!, forState: .disabled)
        button.setBackgroundColor(color: R.color.buttonActive()!, forState: .normal)
        button.setTitleColor(R.color.whiteAlpha019(), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
     let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = R.font.montserratRegular(size: 14)
        button.setTitleColor(R.color.textDefault(), for: .normal)
        
        return button
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wineBackground")
        return imageView
    }()
    
    private let blackBackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.alpha = 0.8
        
        return imageView
        
    }()
    
    override func initSetup() {
        super.initSetup()
        
        addSubview(backgroundImageView)
        addSubview(blackBackgroundView)
        addSubview(wineLabel)
        addSubview(smalLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(forgetButton)
        addSubview(logInButton)
        addSubview(signInButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        loginTextField.snp.makeConstraints { make in
            //  make.width.equalTo(343)
            make.height.equalTo(56)
            make.top.equalTo(smalLabel.snp.bottom).offset(162)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.top.equalTo(loginTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        forgetButton.snp.makeConstraints { make in
            //  make.width.equalTo(343)
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
        }
        
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.top.equalTo(forgetButton.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(110)
            make.right.equalToSuperview().offset(-110)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
        blackBackgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        wineLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(128)
        }
        
        smalLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(wineLabel.snp.bottom)
        }
        
    }
    
    
    
}
