//
//  MoneyToPayViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit

class MoneyToPayViewController: UIViewController {
    
    var presenter: MoneyToPayPresenterContract?
    
    var webView = UIWebView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        setupAutolayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func backButtonDidPress() {
        self.presenter?.goBack()
    }
}

extension MoneyToPayViewController: MoneyToPayViewContract {

}

extension MoneyToPayViewController {
    
    func setupData() {
        self.webView.delegate = self
        
        guard let url = URL(string: "https://www.moneytopay.com/gestion-tarjeta-regalo") else {
            return
        }
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }
}

extension MoneyToPayViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if webView.request?.url?.absoluteString.contains("p_auth") == true {
            
            guard let first = self.presenter?.getCardNumbersFirst() else {
                return
            }
            guard let second = self.presenter?.getCardNumbersSecond() else {
                return
            }
            guard let third = self.presenter?.getCardNumbersThird() else {
                return
            }
            guard let fourth = self.presenter?.getCardNumbersFourth() else {
                return
            }
            guard var month = self.presenter?.getCardMonth() else {
                return
            }
            if month.count == 1 {
                month = "0" + month
            }
            guard var year = self.presenter?.getCardYear() else {
                return
            }
            if year.count == 2 {
                year = "20" + year
            }
            guard let ccv = self.presenter?.getCardCVC() else {
                return
            }
            
            var completedString = String(format: "document.getElementById(\"numero1\").value='%@'", first)
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"numero1\").classList.add(\"input_border_normal_ok\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero2\").value='%@'", second)
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"numero2\").classList.add(\"input_border_normal_ok\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero3\").value='%@'", third)
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"numero3\").classList.add(\"input_border_normal_ok\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero4\").value='%@'", fourth)
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"numero4\").classList.add(\"input_border_normal_ok\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            //Remove number warnings
            completedString = String(format:"document.getElementById(\"numero1\").parentElement.parentElement.classList.replace(\"error_required\",\"add_noerror_margin\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            //CCV
            completedString = String(format: "document.getElementById(\"ccv\").value='%@'", ccv)
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"ccv\").classList.add(\"input_border_normal_ok\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            completedString = String(format: "document.getElementById(\"ccv\").parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.replace(\"error_required\",\"add_noerror_margin\")")
            self.webView.stringByEvaluatingJavaScript(from: completedString)

            //Month
            completedString = String(format: "$(\"button\")[1].click(function(){});")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            var monthInt = Int(month)
            monthInt = monthInt! + 5
            
            completedString = String(format: "$(\"li\")[\(String(format:"%d", monthInt!))].lastChild.click(function(){});")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            
            //Year
            completedString = String(format: "$(\"button\")[2].click(function(){});")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "var input = document.getElementsByTagName(\"span\");for(i = 0;i < input.length; i++){if (input[i].innerText == \(year)) {input[i].parentElement.click(function(){})}}")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
        } else {
            
            let completedString = String(format: "document.getElementsByClassName(\"box\")[1].children[0].click(function(){});")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
