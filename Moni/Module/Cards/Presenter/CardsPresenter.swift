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
    var dataSource: [Card]
    
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
    
    func setupData() {
        dataSource = self.interactor.getAllCards()
        self.view.renderAllCards(cards: dataSource)
    }
    
    func goToEditCard() {
        
    }
    
    func joinWithCard(card: Card) {
        self.router.joinWithCard(card: card)
    }
    
    func addNewCard() {
        self.router.addCard()
    }
}
