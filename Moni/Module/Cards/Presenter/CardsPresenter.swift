//
//  CardsPresenter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class CardsPresenter: NSObject {
    
    var router: CardsRouterContract
    var interactor: CardsInteractorContract
    var view: CardsViewContract
    var dataSource: [String]
    
    init(interactor: CardsInteractorContract,
         view: CardsViewContract,
         router: CardsRouterContract) {
        self.interactor = interactor
        self.view = view
        self.router = router
        dataSource = []
    }
}

extension CardsPresenter: CardsPresenterContract {
    
    func getAllCards() {
        
    }
    
    func goToEditCard() {
        
    }
    
    func joinWithCard() {
        
    }
    
    func addNewCard() {
        self.router.addCard()
    }
}
