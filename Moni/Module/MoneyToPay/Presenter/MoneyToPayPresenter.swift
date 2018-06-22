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
    var card: Card
    
    init(interactor: MoneyToPayInteractorContract,
         view: MoneyToPayViewContract,
         router: MoneyToPayRouterContract,
         card: Card) {
        self.interactor = interactor
        self.view = view
        self.router = router
        self.card = card
    }
}

extension MoneyToPayPresenter: MoneyToPayPresenterContract {
    func getCardNumbersFirst() -> String {
        return String(self.card.number.prefix(4))
    }
    
    func getCardNumbersSecond() -> String {
        let start = self.card.number.index(self.card.number.startIndex, offsetBy: 4)
        let end = self.card.number.index(self.card.number.endIndex, offsetBy: -8)
        let range = start..<end
        
        let substring = self.card.number[range]
        return  String(substring)
    }
    
    func getCardNumbersThird() -> String {
        let start = self.card.number.index(self.card.number.startIndex, offsetBy: 8)
        let end = self.card.number.index(self.card.number.endIndex, offsetBy: -4)
        let range = start..<end
        
        let substring = self.card.number[range]
        return String(substring)
    }
    
    func getCardNumbersFourth() -> String {
        return String(self.card.number.suffix(4))
    }
    
    func getCardMonth() -> String {
        return self.card.month
    }
    
    func getCardYear() -> String {
        return self.card.year
    }
    
    func getCardCVC() -> String {
        return self.card.cvv
    }
    
    func goBack() {
        self.router.goBack()
    }
}
