//
//  WineCell.swift
//  WineShop
//
//  Created by Kostyan on 09.02.2023.
//

import Foundation
import SnapKit

class WineCell: UICollectionViewCell {
    
    var wineLabel: UILabel = {
        let label = UILabel()
        label.text = "Wine"
        label.font = R.font.montserratRegular(size: 16)
        
        return label
    }()
    
    var fromLabel: UILabel = {
        let label = UILabel()
        label.text = "hehe"
        label.font = R.font.montserratRegular(size: 8)
        
        return label
        
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "12999 ₽"
        label.font = R.font.montserratRegular(size: 14)
        
        return label
        
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.favoriteIcon(), for: .normal)
        button.setImage(R.image.favoriteIconPressed(), for: .selected)
        return button
    }()
    
    
    
    var wineImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.basketIcon()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
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
    
    var desription: UILabel = {
        let label = UILabel()
        label.text = "????"
        label.font = R.font.montserratRegular(size: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    
    var stepperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 0.5).cgColor
        view.layer.borderWidth = 1
        view.isHidden = true
        
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
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
    
    
    private func setupConstraints() {
        
        wineLabel.snp.makeConstraints { make in
            make.top.equalTo(wineImage.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            
        }
        
        fromLabel.snp.makeConstraints { make in
            make.top.equalTo(wineLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(8)
        }
        
        wineImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(124)
            make.width.equalTo(152)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(desription.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(9)
        }
        
        basketButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(desription.snp.bottom).offset(4)
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
        
        stepperView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(desription.snp.bottom).offset(4)
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(20)
            make.width.equalTo(23)
        }
        
        desription.snp.makeConstraints { make in
            make.top.equalTo(fromLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(8)
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.right.left.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        addSubview(wineLabel)
        addSubview(fromLabel)
        addSubview(wineImage)
        addSubview(basketButton)
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(plusButton)
        stepperView.addSubview(stackView)
        addSubview(stepperView)
        addSubview(priceLabel)
        addSubview(favoriteButton)
        addSubview(desription)
       
        
        
        plusButton.removeTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        minusButton.removeTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        favoriteButton.removeTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(stepperButtonsPressed), for: .touchUpInside)
        basketButton.addTarget(self, action: #selector(basketButtonPressed), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
        
        setupConstraints()
        
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
                
    @objc func basketButtonPressed() {
        changeStepperButtonState()
        
    }
                                 
    @objc func favoriteButtonPressed() {
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
    
    func changeStepperButtonState() {
        basketButton.isHidden = !basketButton.isHidden
        stepperView.isHidden = !stepperView.isHidden
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
