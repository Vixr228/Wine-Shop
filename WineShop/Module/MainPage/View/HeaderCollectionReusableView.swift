//
//  HeaderCollectionReusableView.swift
//  WineShop
//
//  Created by Костантин Ермош on 09.02.2023.
//

import Foundation
import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifire = "HeaderCollectionReusableView"
    
     var label: UILabel = {
        let label = UILabel()
         label.text = "?????"
         label.textColor = .white
         label.font = R.font.montserratRegular(size: 16)

        return label
     }()
    
    public func configure(){
        //backgroundColor = .systemBlue
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        
    }
    
}
