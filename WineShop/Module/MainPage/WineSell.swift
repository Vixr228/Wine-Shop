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
    
    var favoriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.favoriteIcon()
        return imageView
    }()
    
    
    
    var wineImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.basketIcon()
        return imageView
    }()
    
    var basketButton: UIButton = {
        let button = UIButton()
        button.setTitle("В корзину", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = R.color.button_active()
        button.titleLabel?.font = R.font.montserratRegular(size: 12)
        return button
    }()
    
    var desription: UILabel = {
        let label = UILabel()
        label.text = "????"
        label.font = R.font.montserratRegular(size: 12)
        label.numberOfLines = 0

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
        
        favoriteImage.snp.makeConstraints { make in
            //sizes check
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
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        addSubview(wineLabel)
        addSubview(fromLabel)
        addSubview(wineImage)
        addSubview(basketButton)
        addSubview(priceLabel)
        addSubview(favoriteImage)
        addSubview(desription)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
