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
    
    
    var desription: UILabel = {
        let label = UILabel()
        label.text = "????"
        label.font = R.font.montserratRegular(size: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    
    var stepperView: UIView = {
        let view = StepperView()
        return view
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
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        addSubview(wineLabel)
        addSubview(fromLabel)
        addSubview(wineImage)
        addSubview(stepperView)
        addSubview(priceLabel)
        addSubview(favoriteButton)
        addSubview(desription)
       
        
        favoriteButton.removeTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)

        
        setupConstraints()
        
    }
                                 
    @objc func favoriteButtonPressed() {
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
