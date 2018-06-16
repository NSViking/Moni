//
//  ViewController.swift
//  CheckMyMoney
//
//  Created by Víctor Vicente on 16/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //Components
    var scanCardButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if !CardIOUtilities.canReadCardWithCamera() {
            
        }
        
        setupUI()
        setupAutolayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CardIOUtilities.preloadCardIO()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

internal extension ViewController {
    
    func setupUI() {
        self.view.addSubview(scanCardButton)
        
        self.scanCardButton.backgroundColor = UIColor.black
        self.scanCardButton.setTitle("Scan card", for: .normal)
        self.scanCardButton.addTarget(self, action: #selector(scanCard), for: .touchUpInside)
    }
    
    func setupAutolayout() {
        self.scanCardButton.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(45)
        }
    }
    
    @objc func scanCard() {
        guard let cardIOController = CardIOPaymentViewController.init(paymentDelegate: self) else {
            return
        }
        
        self.present(cardIOController, animated: true, completion: nil)
        
//        let webView = WebViewController()
//        self.present(webView, animated: true, completion: nil)
    }
}

extension ViewController: CardIOPaymentViewControllerDelegate {
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
         paymentViewController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: CardIOViewDelegate {
    func cardIOView(_ cardIOView: CardIOView!, didScanCard cardInfo: CardIOCreditCardInfo!) {
        print(cardInfo)
    }
}

