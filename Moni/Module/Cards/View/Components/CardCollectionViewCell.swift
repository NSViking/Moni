//
//  CardCollectionViewCell.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import CreditCardForm

class CardCollectionViewCell: UICollectionViewCell {
    
    var containerView = UIView()
    var cardTitle = UILabel()
    var cardNumber = UILabel()
    var cardView = CreditCardFormView()
    
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
        self.addSubview(cardView)
        
        cardTitle.font = UIFont.systemFont(ofSize: 16)
        cardTitle.textColor = UIColor.white
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
            maker.top.equalToSuperview().offset(12)
            maker.left.equalToSuperview().offset(8)
            maker.right.equalToSuperview().offset(-8)
        }
        
        self.cardView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.cardTitle.snp.bottom).offset(-8)
            maker.width.equalTo(260)
            maker.height.equalTo(140)
            maker.centerX.equalToSuperview()
        }
    }
    
    func configure(card: Card) {
        
        self.cardTitle.text = card.title
        let year = Int(card.year)
        let month = Int(card.month)
        
        self.cardView.paymentCardTextFieldDidChange(cardNumber: card.number, expirationYear: UInt(bitPattern: year!), expirationMonth: UInt(bitPattern: month!), cvc: card.cvv)
    }
}
