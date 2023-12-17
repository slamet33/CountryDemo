//
//  WebvIEW.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let htmlString = """
        <html>
        <body style="margin:0;padding:0;overflow:hidden;">
        <img src="\(url.absoluteString)" style="width:100vw; height:auto; top:0; margin:0; padding:0;">
        </body>
        </html>
        """
        webView.scrollView.isScrollEnabled = false
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
