//
//  WineCell.swift
//  WineShop
//
//  Created by Kostyan on 09.02.2023.
//

import Foundation
import SnapKit
import ImageSlideshow

class SliderCell: UICollectionViewCell {
    
    
    public var slider: ImageSlideshow = {
        let slider = ImageSlideshow()
        slider.backgroundColor = R.color.background()
        slider.layer.cornerRadius = 4
        slider.layer.masksToBounds = true
        
        return slider
    }()
    
    
    
    private func setupConstraints() {
        
        slider.snp.makeConstraints { make in
            make.height.equalTo(168)
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
        }
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//                backgroundColor = .systemBlue
        addSubview(slider)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
