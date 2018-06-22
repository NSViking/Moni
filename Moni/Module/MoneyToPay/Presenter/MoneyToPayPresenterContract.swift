//
//  MoneyToPayPresenterContract.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

protocol MoneyToPayPresenterContract {
    func getCardNumbersFirst() -> String
    func getCardNumbersSecond() -> String
    func getCardNumbersThird() -> String
    func getCardNumbersFourth() -> String
    func getCardMonth() -> String
    func getCardYear() -> String
    func getCardCVC() -> String
    
    func goBack()
}
