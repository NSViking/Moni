//
//  CardsRouter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class CardsRouter: NSObject {
    var viewController: CardsViewController
    
    init(viewController: CardsViewController) {
        self.viewController = viewController
    }
}

extension CardsRouter: CardsRouterContract {
    
    func addCard() {
        let addCardVC = AddCardConfigurator.createAddCardViperStack()
        addCardVC.modalTransitionStyle = .crossDissolve
        self.viewController.present(addCardVC, animated: true, completion: nil)
    }
    
    func joinWithCard() {
        
    }
    
    func goToEditCard() {
        
    }
}
