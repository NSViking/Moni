//
//  CardsRepositoryContract.swift
//  Moni
//
//  Created by Víctor Vicente on 21/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

protocol CardsRepositoryContract {
    func saveCard(card: Card)
    func getAllCards() -> [Card]
    func deleteCard(card: Card)
}
