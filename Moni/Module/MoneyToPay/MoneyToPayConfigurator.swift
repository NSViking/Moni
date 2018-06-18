//
//  MoneyToPayConfigurator.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class MoenyToPayConfigurator: NSObject {
    
    class func createMoneyToPayViperStack() -> MoneyToPayViewController {
        
        let cardsVC = MoneyToPayViewController()
        configure(cardsVC)
        
        return cardsVC
    }
}

extension MoenyToPayConfigurator {
    
    class func configure(_ viewController: MoneyToPayViewController) {
        
        let router = MoneyToPayRouter(viewController: viewController)
        let interactor = MoneyToPayInteractor()
        let presenter = MoneyToPayPresenter(interactor: interactor, view: viewController, router: router)
        
        viewController.presenter = presenter
    }
}
