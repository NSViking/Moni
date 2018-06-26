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
        self.view.addSubview(self.removeButton)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.emptyTitle)
        self.view.addSubview(self.emptyImageView)
        self.view.addSubview(self.cancelRemoveButton)
        self.view.addSubview(self.confirmRemoveButton)
        
        self.view.backgroundColor = UIColor.white
        
        self.addButton.setImage(IonIcons.image(withIcon: ion_android_add_circle, size: 35, color: UIColor.moni_pink()), for: .normal)
        self.addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
        
        self.removeButton.setImage(IonIcons.image(withIcon: ion_ios_trash, size: 35, color: UIColor.moni_pink()), for: .normal)
        self.removeButton.addTarget(self, action: #selector(removeButtonDidPress), for: .touchUpInside)
        
        self.cancelRemoveButton.setTitle("Cancel", for: .normal)
        self.cancelRemoveButton.addTarget(self, action: #selector(cancelRemoveButtonDidPress), for: .touchUpInside)
        self.cancelRemoveButton.setTitleColor(UIColor.moni_pink(), for: .normal)
        self.cancelRemoveButton.setBackgroundImage(UIImage(color: UIColor.white), for: .normal)
        self.cancelRemoveButton.layer.cornerRadius = 20
        self.cancelRemoveButton.layer.masksToBounds = true
        self.cancelRemoveButton.layer.borderColor = UIColor.moni_pink().cgColor
        self.cancelRemoveButton.layer.borderWidth = 1
        
        self.confirmRemoveButton.setTitle("Confirm", for: .normal)
        self.confirmRemoveButton.addTarget(self, action: #selector(confirmRemoveButtonDidPress), for: .touchUpInside)
        self.confirmRemoveButton.setTitleColor(UIColor.white, for: .normal)
        self.confirmRemoveButton.setBackgroundImage(UIImage(color: UIColor.moni_pink()), for: .normal)
        self.confirmRemoveButton.layer.cornerRadius = 20
        self.confirmRemoveButton.layer.masksToBounds = true
        self.cancelRemoveButton.layer.borderColor = UIColor.moni_pink().cgColor
        self.cancelRemoveButton.layer.borderWidth = 1
        
        
        self.titleLabel.textColor = UIColor.moni_pink()
        self.titleLabel.font = UIFont.moni_bold(36)
        self.titleLabel.numberOfLines = 0
        
        self.collectionView.backgroundColor = UIColor.clear
        
        self.emptyImageView.image = #imageLiteral(resourceName: "credit-cards-payment")
        self.emptyImageView.contentMode = .scaleAspectFit
        self.emptyTitle.textColor = UIColor.moni_pink()
        self.emptyTitle.font = UIFont.moni_black(16)
        self.emptyTitle.numberOfLines = 0
        self.emptyTitle.textAlignment = .center
    }
    
    func setupAutolayout() {
        self.addButton.snp.makeConstraints { (maker) in
            maker.right.equalToSuperview().offset(-20)
            maker.top.equalToSuperview().offset(40)
            maker.height.equalTo(45)
            maker.width.equalTo(45)
        }
        
        self.removeButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(self.addButton.snp.left).offset(-20)
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
        
        self.emptyImageView.snp.makeConstraints { (maker) in
            maker.width.equalTo(150)
            maker.height.equalTo(150)
            maker.center.equalToSuperview()
        }
        
        self.emptyTitle.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.emptyImageView.snp.bottom).offset(10)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
        }
        
        self.cancelRemoveButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-12)
            maker.left.equalToSuperview().offset(15)
            maker.height.equalTo(45)
        }
        
        self.confirmRemoveButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-12)
            maker.right.equalToSuperview().offset(-15)
            maker.height.equalTo(45)
            maker.left.equalTo(self.cancelRemoveButton.snp.right).offset(20)
            maker.width.equalTo(self.cancelRemoveButton.snp.width)
        }
    }
}
