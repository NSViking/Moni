//
//  WebViewController.swift
//  CheckMyMoney
//
//  Created by Víctor Vicente on 16/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation

class WebViewController: UIViewController {
    
    var webView = UIWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupData()
        setupAutolayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupUI() {
        self.view.addSubview(webView)
    }
    
    func setupAutolayout() {
        self.webView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
    func setupData() {
        self.webView.delegate = self
        
        guard let url = URL(string: "https://www.moneytopay.com/gestion-tarjeta-regalo") else {
            return
        }
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }
}

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if webView.request?.url?.absoluteString.contains("p_auth") == true {
            
//            let completedString = String(format: "document.activation-form.numero1.value='%@'", "3455")
            var completedString = String(format: "document.getElementById(\"numero1\").value='%@'", "3455")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero2\").value='%@'", "3455")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero3\").value='%@'", "3455")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"numero4\").value='%@'", "3455")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
            completedString = String(format: "document.getElementById(\"ccv\").value='%@'", "345")
            self.webView.stringByEvaluatingJavaScript(from: completedString)
            
//            completedString = String(format: "document.getElementById(\"numero1\").value='%@'", "3455")
//            self.webView.stringByEvaluatingJavaScript(from: completedString)
//
//            completedString = String(format: "document.getElementById(\"numero1\").value='%@'", "3455")
//            self.webView.stringByEvaluatingJavaScript(from: completedString)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
