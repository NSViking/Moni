//
//  CardsPresenterContract.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

protocol CardsPresenterContract {
    func setupData()
    func goToEditCard()
    func removeCard(card: Card)
    func addNewCard()
    func joinWithCard(card: Card)
}
