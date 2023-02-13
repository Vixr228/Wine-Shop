//
//  WineCell.swift
//  WineShop
//
//  Created by Kostyan on 09.02.2023.
//

import Foundation
import SnapKit

class SimpleWineCell: UICollectionViewCell {
    
    
    var wineLabel: UILabel = {
        let label = UILabel()
        label.text = "Wine"
        label.font = R.font.montserratRegular(size: 10)
        
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
        label.font = R.font.montserratRegular(size: 12)
        
        return label
        
    }()
    
    var wineImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.basketIcon()
        return imageView
    }()
    
    var basketImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.basketIcon()
        return imageView
    }()
    
//    var desription: UILabel = {
//        let label = UILabel()
//        label.text = "????"
//        label.font = R.font.montserratRegular(size: 12)
//
//        return label
//    }()
    
    
    
    private func setupConstraints() {
        
        wineLabel.snp.makeConstraints { make in
            make.top.equalTo(wineImage.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(9)
        }
        
        fromLabel.snp.makeConstraints { make in
            make.top.equalTo(wineLabel.snp.bottom).offset(1)
            make.left.equalToSuperview().offset(9)
        }
        
        wineImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(82)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(fromLabel.snp.bottom).offset(13)
            make.left.equalToSuperview().offset(9)
        }
        
        basketImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(priceLabel.snp.top)
            make.height.width.equalTo(16)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        addSubview(wineLabel)
        addSubview(fromLabel)
        addSubview(wineImage)
        addSubview(basketImage)
        addSubview(priceLabel)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
