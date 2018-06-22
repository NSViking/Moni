//
//  AddCardPresenterContract.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

protocol AddCardPresenterContract {
    func saveCard(name: String, number: String, month: String, year: String, cvv: String)
    func goBack()
}
