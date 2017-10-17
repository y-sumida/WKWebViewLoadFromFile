//
//  ViewController.swift
//  WKWebViewLoadFromFile
//
//  Created by 住田祐樹 on 2017/10/17.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webview)
        
        if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            let fileName = "test.html"
            let path = documentDirectoryFileURL.appendingPathComponent(fileName)
            
            print("path: \(path)")
            
            do {
                try path.absoluteString.write(to: path, atomically: true, encoding: String.Encoding.utf8)
                webview.loadFileURL(path, allowingReadAccessTo: path)
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



