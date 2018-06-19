//
//  CardsViewController+Layout.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import ionicons

extension CardsViewController {
    
    func setupUI() {
        self.view.addSubview(self.addButton)
        
        self.view.backgroundColor = UIColor.orange
        
        self.addButton.setImage(IonIcons.image(withIcon: ion_android_add_circle, size: 35, color: UIColor.white), for: .normal)
        self.addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
    }
    
    func setupAutolayout() {
        self.addButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
            maker.height.equalTo(45)
            maker.width.equalTo(45)
        }
    }
}
