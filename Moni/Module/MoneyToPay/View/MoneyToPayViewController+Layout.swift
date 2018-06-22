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
        self.view.addSubview(backButton)
        
        self.view.backgroundColor = UIColor.white
        self.webView.backgroundColor = UIColor.white
        
        self.titleLabel.text = ""
        
        self.backButton.setImage(IonIcons.image(withIcon: ion_close, size: 35, color: UIColor.darkGray), for: .normal)
        self.backButton.setTitle("", for: .normal)
        self.backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        
    }
    
    func setupAutolayout() {
    
        self.backButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
        }
        
        self.webView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.equalTo(self.backButton.snp.bottom).offset(10)
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
