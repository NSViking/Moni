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
        
    }
    
    func joinWithCard() {
        
    }
    
    func goToEditCard() {
        
    }
}
