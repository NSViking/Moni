//
//  MoneyToPayPresenter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class MoneyToPayPresenter: NSObject {
    
    var router: MoneyToPayRouterContract
    var interactor: MoneyToPayInteractorContract
    var view: MoneyToPayViewContract
    var dataSource: [String]
    
    init(interactor: MoneyToPayInteractorContract,
         view: MoneyToPayViewContract,
         router: MoneyToPayRouterContract) {
        self.interactor = interactor
        self.view = view
        self.router = router
        dataSource = []
    }
}

extension MoneyToPayPresenter: MoneyToPayPresenterContract {
    
    func getCard() {
        
    }
}
