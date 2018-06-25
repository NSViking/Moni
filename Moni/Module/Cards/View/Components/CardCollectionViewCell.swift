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
        
        cardTitle.font = UIFont.moni_bold(16)
        cardTitle.textColor = UIColor.moni_pink()
        cardTitle.numberOfLines = 0
        cardTitle.textAlignment = .left
        
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
            maker.left.equalTo(self.cardView.snp.left)
            maker.right.equalTo(self.cardView.snp.right)
        }
        
        self.cardView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.cardTitle.snp.bottom).offset(14)
            maker.width.equalTo(260)
            maker.height.equalTo(140)
            maker.centerX.equalToSuperview()
        }
    }
    
    func configure(card: Card) {
        
        self.cardTitle.text = card.title
        let year = Int(card.year)
        let month = Int(card.month)
        
        let number = card.number
        
        self.cardView.paymentCardTextFieldDidChange(cardNumber: number, expirationYear: UInt(bitPattern: year!), expirationMonth: UInt(bitPattern: month!), cvc: card.cvv)
        self.cardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: UInt(bitPattern: year!))
        self.cardView.paymentCardTextFieldDidBeginEditingCVC()
        self.cardView.paymentCardTextFieldDidEndEditingCVC()
    }
}
