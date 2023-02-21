//
//  WineCell.swift
//  WineShop
//
//  Created by Kostyan on 09.02.2023.
//

import Foundation
import SnapKit

class BasketCell: UITableViewCell {
    
    var wineImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.basketIcon()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
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
    
    var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "В избранное"
        label.font = R.font.montserratRegular(size: 14)
        
        return label
        
    }()
    
    var desription: UILabel = {
        let label = UILabel()
        label.text = "????"
        label.font = R.font.montserratRegular(size: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Купить", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = R.color.buttonActive()
        button.titleLabel?.font = R.font.montserratRegular(size: 12)
        button.isHidden = false
        button.layer.cornerRadius = 4
        return button
    }()
    
    var favoriteView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(red: 0.234, green: 0.771, blue: 0.771, alpha: 1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("  В избранное", for: .normal)
        button.titleLabel?.font = R.font.montserratRegular(size: 12)
        button.setImage(R.image.favoriteIconSmall(), for: .normal)
        button.setImage(R.image.favoriteIconPressed(), for: .selected)
        return button
    }()
    
    lazy var stepperView: UIView = {
        let view = StepperView()
        return view
    }()
    
    var viewContent: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03)
        view.layer.cornerRadius = 4
        return view
    }()
    
    private func setupConstraints() {

        viewContent.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        buyButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(priceLabel.snp.bottom).offset(14)
            make.height.equalTo(32)
            make.width.equalTo(100)
        }
        
        wineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalTo(wineImage.snp.right).offset(12)
            
        }
        
        fromLabel.snp.makeConstraints { make in
            make.top.equalTo(wineLabel.snp.bottom).offset(2)
            make.left.equalTo(wineImage.snp.right).offset(12)
        }
        
        wineImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.height.equalTo(124)
            make.width.equalTo(152)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(desription.snp.bottom).offset(22)
            make.left.equalTo(wineImage.snp.right).offset(12)
        }
        
        stepperView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(14)
            make.right.equalTo(buyButton.snp.left).offset(-12)
            make.height.equalTo(32)
            make.width.equalTo(76)
            
        }
        
        desription.snp.makeConstraints { make in
            make.top.equalTo(fromLabel.snp.bottom).offset(8)
            make.left.equalTo(wineImage.snp.right).offset(12)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = R.color.background()
//        layer.cornerRadius = 4
        addSubview(viewContent)
        viewContent.addSubview(wineLabel)
        viewContent.addSubview(fromLabel)
        viewContent.addSubview(wineImage)
        viewContent.addSubview(priceLabel)
        viewContent.addSubview(desription)
        contentView.addSubview(buyButton)
        viewContent.addSubview(favoriteButton)
        contentView.addSubview(stepperView)
       
        
        favoriteButton.removeTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        buyButton.removeTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        setupConstraints()
        
    }
    
    @objc func favoriteButtonPressed() {
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
    
    @objc func buyButtonPressed() {
        print("aaaaaa")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
