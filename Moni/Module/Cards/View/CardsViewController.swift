//
//  CardsViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit

class CardsViewController: UIViewController {
    
    var presenter: CardsPresenterContract?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension CardsViewController: CardsViewContract {
    
}
