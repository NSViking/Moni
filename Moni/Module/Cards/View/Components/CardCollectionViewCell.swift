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
import ionicons

class CardCollectionViewCell: UICollectionViewCell {
    
    var containerView = UIView()
    var cardTitle = UILabel()
    var cardNumber = UILabel()
    var cardView = CreditCardFormView()
    
    var bulletButton = UIButton()
    
    var card: Card?
    
    var bulletButtonClousure:((_ card: Card) -> Void)?
    
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
        self.addSubview(bulletButton)
        
        cardTitle.font = UIFont.moni_bold(16)
        cardTitle.textColor = UIColor.moni_pink()
        cardTitle.numberOfLines = 0
        cardTitle.textAlignment = .left
        
        containerView.backgroundColor = UIColor.clear
        
        bulletButton.setImage(IonIcons.image(withIcon: ion_android_radio_button_off, size: 45, color: UIColor.moni_pink()), for: .normal)
        bulletButton.setImage(IonIcons.image(withIcon: ion_checkmark_circled, size: 45, color: UIColor.moni_pink()), for: .selected)
        bulletButton.setImage(IonIcons.image(withIcon: ion_checkmark_circled, size: 45, color: UIColor.moni_pink()), for: .highlighted)
        bulletButton.addTarget(self, action: #selector(bulletButtonDidPress), for: .touchUpInside)
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
        
        self.bulletButton.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().offset(5)
            maker.width.equalTo(50)
            maker.height.equalTo(50)
        }
    }
    
    func configure(card: Card, removeEnabled: Bool, isSelected: Bool) {
        self.card = card
        
        self.cardTitle.text = card.title
        let year = Int(card.year)
        let month = Int(card.month)
        
        let number = card.number
        
        self.cardView.paymentCardTextFieldDidChange(cardNumber: number, expirationYear: UInt(bitPattern: year!), expirationMonth: UInt(bitPattern: month!), cvc: card.cvv)
        self.cardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: UInt(bitPattern: year!))
        self.cardView.paymentCardTextFieldDidBeginEditingCVC()
        self.cardView.paymentCardTextFieldDidEndEditingCVC()
        
        self.bulletButton.isHidden = !removeEnabled
        self.bulletButton.isSelected = isSelected
    }
    
    @objc func bulletButtonDidPress() {
        if (self.bulletButtonClousure != nil) {
            self.bulletButtonClousure!(self.card!)
        }
    }
}
