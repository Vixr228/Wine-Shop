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
        label.font = R.font.philosopherRegular(size: 10)

        return label
    }()
    
   var fromLabel: UILabel = {
        let label = UILabel()
        label.text = "hehe"
        label.font = R.font.montserratRegular(size: 6)
        
        return label
        
    }()
    
    
    
    
    private func setupConstraints() {
        
        wineLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        fromLabel.snp.makeConstraints { make in
            make.top.equalTo(wineLabel.snp.bottom)
        }
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(wineLabel)
        addSubview(fromLabel)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
