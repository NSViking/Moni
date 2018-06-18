//
//  AddCardRouter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class AddCardRouter: NSObject {
    var viewController: AddCardViewController
    
    init(viewController: AddCardViewController) {
        self.viewController = viewController
    }
}

extension AddCardRouter: AddCardRouterContract {

    func goBack() {
        
    }
}
