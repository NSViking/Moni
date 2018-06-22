//
//  MoneyToPayViewController+Layout.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import ionicons

extension MoneyToPayViewController {
    
    func setupUI() {
        self.view.addSubview(webView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(backButton)
        
        self.view.backgroundColor = UIColor.white
        self.webView.backgroundColor = UIColor.white
        
        self.titleLabel.text = ""
        
        self.backButton.setImage(IonIcons.image(withIcon: ion_close, size: 35, color: UIColor.darkGray), for: .normal)
        self.backButton.setTitle("", for: .normal)
        self.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        
        self.descriptionLabel.textColor = UIColor.moni_black()
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.moni_light(16)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.text = "We are here for save your time, but it's necessary enter the last field.\nAlways for your security 😘"
    }
    
    func setupAutolayout() {
    
        self.backButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
        }
        
        self.descriptionLabel.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(50)
            maker.left.equalToSuperview().offset(60)
            maker.right.equalToSuperview().offset(-60)
        }
        
        self.webView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.equalTo(self.descriptionLabel.snp.bottom).offset(10)
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
