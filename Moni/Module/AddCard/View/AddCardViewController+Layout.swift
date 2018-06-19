//
//  AddCardViewController+Layout.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import ionicons

extension AddCardViewController {
    
    func setupUI() {
        self.view.backgroundColor = UIColor.moni_pink()
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.creditCardForm)
        self.view.addSubview(self.paymentTextField)
        self.view.addSubview(self.saveButton)
        
        self.closeButton.setImage(IonIcons.image(withIcon: ion_close_circled, size: 35, color: UIColor.white), for: .normal)
        self.closeButton.addTarget(self, action: #selector(closeButtonDidPress), for: .touchUpInside)
        
        self.saveButton.setTitle("SAVE", for: .normal)
        self.saveButton.backgroundColor = UIColor.white
        self.saveButton.layer.masksToBounds = true
        self.saveButton.layer.cornerRadius = 22
        self.saveButton.setTitleColor(UIColor.moni_pink(), for: .normal)
        self.saveButton.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
        
        self.paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width - 30, height: 44)
        self.paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        self.paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.paymentTextField.frame.size.height - width, width:  self.paymentTextField.frame.size.width, height: self.paymentTextField.frame.size.height)
        border.borderWidth = width
        self.paymentTextField.layer.addSublayer(border)
        self.paymentTextField.layer.masksToBounds = true
        
        self.paymentTextField.delegate = self
        
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.moni_bold(36)
        self.titleLabel.numberOfLines = 0
    }
    
    func setupAutolayout() {
        
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(20)
            maker.top.equalToSuperview().offset(40)
        }
        
        self.creditCardForm.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            maker.width.equalTo(260)
            maker.height.equalTo(140)
            maker.centerX.equalToSuperview()
        }
        
        self.paymentTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.creditCardForm.snp.bottom).offset(20)
            maker.left.equalTo(self.creditCardForm.snp.left)
            maker.right.equalTo(self.creditCardForm.snp.right)
            maker.height.equalTo(44)
        }
        
        self.saveButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.paymentTextField.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(44)
            maker.centerX.equalToSuperview()
        }
        
        self.closeButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
            maker.width.equalTo(45)
            maker.height.equalTo(45)
        }
    }
}
