//
//  ViewController.swift
//  hacking with swift project 4
//
//  Created by karim metawea on 3/23/19.
//  Copyright © 2019 karim metawea. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate {
    
    var webView:WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        self.view = webView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(openTapped))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    @objc func openTapped(){
        let ac = UIAlertController(title: "choose your website", message: nil, preferredStyle: .actionSheet)
        let apple = UIAlertAction(title: "apple.com", style: .default, handler: (openSite))
        let hackingwithSwift = UIAlertAction(title: "hackingwithswift.com", style: .default, handler: (openSite))
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        ac.addAction(apple)
        ac.addAction(hackingwithSwift)
        ac.addAction(cancelAction)
        present(ac,animated: true)
    }
    
    func openSite(action:UIAlertAction){
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://"+actionTitle) else {return}
        webView.load(URLRequest(url: url))
    }


}

