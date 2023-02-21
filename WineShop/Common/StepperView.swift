//
//  StepperView.swift
//  WineShop
//
//  Created by Костантин Ермош on 16.02.2023.
//

import Foundation
import SnapKit

class StepperView: UIView {
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.isHidden = true
        stackView.layer.borderColor = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 0.5).cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 4
        
        return stackView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        button.titleLabel?.textAlignment = .center
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        button.titleLabel?.textAlignment = .center
        button.setTitle("-", for: .normal)
        
        return button
    }()
    
    var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        
        return label
    }()
    
    var basketButton: UIButton = {
        let button = UIButton()
        button.setTitle("В корзину", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = R.color.buttonActive()
        button.titleLabel?.font = R.font.montserratRegular(size: 12)
        button.isHidden = false
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        layer.cornerRadius = 4
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(plusButton)
        addSubview(stackView)
        addSubview(basketButton)
      
        
        plusButton.removeTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        minusButton.removeTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        basketButton.removeTarget(self, action: #selector(basketButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        basketButton.addTarget(self, action: #selector(basketButtonPressed), for: .touchUpInside)
     
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.right.left.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        basketButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.right.left.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
    
    @objc func basketButtonPressed() {
        changeStepperButtonState()
        
    }
    
    @objc func stepperButtonsPressed (button: UIButton){
        let operation = button.titleLabel?.text
        if let counter = counterLabel.text {
            var count = Int(counter)!

            switch operation {
                case "+":
                    if count >= 0 {
                        count += 1
                    }
                case "-":
                    if count > 1 {
                        count -= 1
                    } else if count == 1 {
                        changeStepperButtonState()
                    }
                default:
                    print("??")

            }

            counterLabel.text = "\(count)"

        }
    }
    
    func changeStepperButtonState() {
           basketButton.isHidden = !basketButton.isHidden
           stackView.isHidden = !stackView.isHidden
       }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
