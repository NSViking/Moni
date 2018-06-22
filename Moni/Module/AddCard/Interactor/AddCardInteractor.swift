//
//  AddCardInteractor.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class AddCardInteractor: NSObject {
    
    var repo: CardsRepository
    
    init(repo: CardsRepository) {
        self.repo = repo
    }
}

extension AddCardInteractor: AddCardInteractorContract {
    
    func saveCard(card: Card) {
        self.repo.saveCard(card: card)
    }
}
