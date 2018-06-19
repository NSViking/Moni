//
//  AddCardViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import Stripe
import CreditCardForm

class AddCardViewController: UIViewController {
    
    var presenter: AddCardPresenterContract?
    
    var closeButton = UIButton()
    var creditCardForm = CreditCardFormView()
    var paymentTextField = STPPaymentCardTextField()
    var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutolayout()
    }
}

extension AddCardViewController: STPPaymentCardTextFieldDelegate
{
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
        
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidEndEditingCVC()
    }
}

extension AddCardViewController: AddCardViewContract {
    
}

extension AddCardViewController {
    
    @objc func closeButtonDidPress() {
        self.presenter?.goBack()
    }
    
    @objc func saveButtonDidPress() {
        self.presenter?.goBack()
    }
}
