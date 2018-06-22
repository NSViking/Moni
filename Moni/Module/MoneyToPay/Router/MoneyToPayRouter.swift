//
//  MoneyToPayRouter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class MoneyToPayRouter: NSObject {
    var viewController: MoneyToPayViewController
    
    init(viewController: MoneyToPayViewController) {
        self.viewController = viewController
    }
}

extension MoneyToPayRouter: MoneyToPayRouterContract {
    
    func goBack() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
