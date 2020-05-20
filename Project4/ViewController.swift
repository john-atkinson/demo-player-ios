//
//  ViewController.swift
//  Project4
//
//  Created by John Atkinson on 5/1/20.
//  Copyright © 2020 John Atkinson. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let url = URL(string: "https://www.hackingwithswift.com")!
        //webView.load(URLRequest(url: url))
        
        webView.load(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test/index", ofType: "html")!)))
        
        //let urlpath = Bundle.main.path(forResource: "index", ofType: "html");
        //let requesturl = URL(string: urlpath!)
        //let request = URLRequest(url: requesturl!)
        //webView.load(request)
        
        //if let path = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "test") {
        //    webView.load(URLRequest(url: URL(fileURLWithPath: path)) )
        //}
        
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "textrecipe.io/2020/05/18/sk-ad-server-html5-player-embed/", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "www.youtube.com/watch?v=_8mGq9DLByE", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "vimeo.com/410011254", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

