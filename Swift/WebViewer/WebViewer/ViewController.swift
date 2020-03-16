//
//  ViewController.swift
//  WebViewer
//
//  Created by Terry Dengis on 12/10/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "http://www.shawconnect.ca")
        let request = URLRequest (url: url!)
        
        webView.load(request)
        
        webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        activityIndicator.hidesWhenStopped = true
        
    }

    @IBAction func back(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        let url = URL (string: "http://\(searchBar.text!)")
        let request = URLRequest (url: url!)
        
        webView.load(request)

    }
}

