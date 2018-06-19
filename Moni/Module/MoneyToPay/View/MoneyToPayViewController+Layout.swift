//
//  MoneyToPayViewController+Layout.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

extension MoneyToPayViewController {
    
    func setupUI() {
        self.view.addSubview(webView)
    }
    
    func setupAutolayout() {
        self.webView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
