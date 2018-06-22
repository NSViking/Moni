//
//  CardsRepository.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import RealmSwift

class CardsRepository: NSObject {
    
}

extension CardsRepository: CardsRepositoryContract {
    
    func saveCard(card: Card) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(card)
        }
    }
    
    func getAllCards() -> [Card] {
        let realm = try! Realm()
        return realm.objects(Card.self).reversed()
    }
    
    func deleteCard(card: Card) {
        let realm = try! Realm()
        realm.delete(card)
    }
}


