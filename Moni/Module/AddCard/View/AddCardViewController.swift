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
    
    var titleLabel = UILabel()
    var closeButton = UIButton()
    var creditCardForm = CreditCardFormView()
    var paymentTextField = STPPaymentCardTextField()
    var titleTextfield = UITextField()
    var separatorLineView = UIView()
    var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutolayout()
        setupData()
    }
    
    func setupData() {
        self.titleTextfield.placeholder = "Enter a name for your card"
        self.titleLabel.text = "Add Card"
        self.saveButton.isEnabled = false
    }
}

extension AddCardViewController: STPPaymentCardTextFieldDelegate
{
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardForm.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
        
        if textField.cardNumber != "" && textField.expirationYear != 0 && textField.expirationMonth != 0 && textField.cvc != "" {
            self.saveButton.isEnabled = true
        }
        
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
        
        if (self.titleTextfield.text != nil && self.titleTextfield.text != "") {
            let month = "\(self.paymentTextField.expirationMonth)"
            let year = "\(self.paymentTextField.expirationYear)"
            guard let cardNumber = self.paymentTextField.cardNumber else {
                return
            }
            guard let cvc = self.paymentTextField.cvc else {
                return
            }
            
            guard let name = self.titleTextfield.text else {
                return
            }
            
            self.presenter?.saveCard(name: name, number: cardNumber, month: month, year: year, cvv: cvc)
            
            self.presenter?.goBack()
        } else {
            
        }
    }
}
