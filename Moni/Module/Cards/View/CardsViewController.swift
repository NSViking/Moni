//
//  CardsViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import Stripe

class CardsViewController: UIViewController {
    
    var presenter: CardsPresenterContract?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutolayout() 
    }
}

extension CardsViewController: CardsViewContract {
    
}

extension CardsViewController {
    
    @objc func addButtonDidPress() {
        self.presenter?.addNewCard()
    }
}
