//
//  CardsInteractor.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class CardsInteractor: NSObject {
    
    var repo: CardsRepository
    
    init(repo: CardsRepository) {
        self.repo = repo
    }
}

extension CardsInteractor: CardsInteractorContract {
    
    func getAllCards() -> [Card] {
        return self.repo.getAllCards()
    }
}
