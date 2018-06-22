//
//  AddCardPresenter.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class AddCardPresenter: NSObject {
    
    var router: AddCardRouterContract
    var interactor: AddCardInteractorContract
    var view: AddCardViewContract
    var dataSource: [String]
    
    init(interactor: AddCardInteractorContract,
         view: AddCardViewContract,
         router: AddCardRouterContract) {
        self.interactor = interactor
        self.view = view
        self.router = router
        dataSource = []
    }
}

extension AddCardPresenter: AddCardPresenterContract {
    
    func saveCard(name: String, number: String, month: String, year: String, cvv: String) {
        let card = Card(title: name, number: number, month: month, year: year, cvv: cvv)
        self.interactor.saveCard(card: card)
    }
    
    func goBack() {
        self.router.goBack()
    }
}
