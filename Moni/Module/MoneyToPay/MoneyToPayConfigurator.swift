//
//  MoneyToPayConfigurator.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class MoneyToPayConfigurator: NSObject {
    
    class func createMoneyToPayViperStack(card: Card) -> MoneyToPayViewController {
        
        let cardsVC = MoneyToPayViewController()
        configure(cardsVC, card: card)
        
        return cardsVC
    }
}

extension MoneyToPayConfigurator {
    
    class func configure(_ viewController: MoneyToPayViewController, card: Card) {
        
        let router = MoneyToPayRouter(viewController: viewController)
        let interactor = MoneyToPayInteractor()
        let presenter = MoneyToPayPresenter(interactor: interactor, view: viewController, router: router, card: card)
        
        viewController.presenter = presenter
    }
}
