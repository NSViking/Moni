//
//  MoneyToPayViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit

class MoneyToPayViewController: UIViewController {
    
    var presenter: MoneyToPayPresenterContract?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MoneyToPayViewController: MoneyToPayViewContract {
    
}
