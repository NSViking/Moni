//
//  AddCardConfigurator.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class AddCardConfigurator: NSObject {
    
    class func createAddCardViperStack() -> AddCardViewController {
        
        let cardsVC = AddCardViewController()
        configure(cardsVC)
        
        return cardsVC
    }
}

extension AddCardConfigurator {
    
    class func configure(_ viewController: AddCardViewController) {
        
        let router = AddCardRouter(viewController: viewController)
        let interactor = AddCardInteractor()
        let presenter = AddCardPresenter(interactor: interactor, view: viewController, router: router)
        
        viewController.presenter = presenter
    }
}
