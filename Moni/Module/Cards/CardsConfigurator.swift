//
//  CardsConfigurator.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class CardsConfigurator: NSObject {
    
    class func createCardsViperStack() -> CardsViewController {
        
        let cardsVC = CardsViewController()
        configure(cardsVC)
        
        return cardsVC
    }
}

extension CardsConfigurator {
    
    class func configure(_ viewController: CardsViewController) {
        
        let router = CardsRouter(viewController: viewController)
        let repo = CardsRepository()
        let interactor = CardsInteractor(repo: repo)
        let presenter = CardsPresenter(interactor: interactor, view: viewController, router: router)
        
        viewController.presenter = presenter
    }
}
