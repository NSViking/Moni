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
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: 120)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.addButton)
        self.view.addSubview(self.titleLabel)
        
        self.view.backgroundColor = UIColor.moni_pink()
        
        self.addButton.setImage(IonIcons.image(withIcon: ion_android_add_circle, size: 35, color: UIColor.white), for: .normal)
        self.addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
        
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.moni_bold(36)
        self.titleLabel.numberOfLines = 0
        
        self.collectionView.backgroundColor = UIColor.clear
    }
    
    func setupAutolayout() {
        self.addButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
            maker.height.equalTo(45)
            maker.width.equalTo(45)
        }
        
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(20)
            maker.top.equalToSuperview().offset(40)
        }
        
        self.collectionView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(90)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
