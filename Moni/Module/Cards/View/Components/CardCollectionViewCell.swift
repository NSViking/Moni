//
//  CardCollectionViewCell.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var containerView = UIView()
    var cardTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {

        self.addSubview(containerView)
        self.addSubview(cardTitle)
        
        cardTitle.font = UIFont.systemFont(ofSize: 16)
        cardTitle.textColor = UIColor.darkGray
        cardTitle.numberOfLines = 0
        cardTitle.textAlignment = .center
        
        containerView.backgroundColor = UIColor.clear
    }
    
    func setupConstraints() {
        self.containerView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().offset(-26)
            maker.top.equalToSuperview().offset(8)
            maker.bottom.equalToSuperview().offset(-8)
        }
        
        self.cardTitle.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-16)
            maker.left.equalToSuperview().offset(8)
            maker.right.equalToSuperview().offset(-8)
        }
    }
    
    func configure(title: String, imageURL: URL) {
        cardTitle.text = title
    }
}
