//
//  ContentView.swift
//  Country-Demo
//
//  Created by Slamet on 14/12/23.
//

import SwiftUI
import WebKit

// MARK: CustomView
struct CountryView: View {
    
    var country: CountryEntity
    
    var body: some View {
        HStack {
            WebView(url: country.imageUrl!, width: 100, height: 100)
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .imageScale(Image.Scale.small)
                .clipped()
                .contentShape(Rectangle())
            Text(country.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let country = Country(id: 0, name: "Indonesia", flag: "https://upload.wikimedia.org/wikipedia/commons/9/9f/Flag_of_Indonesia.svg")
        CountryView(country: CountryEntity(response: country))
    }
}

// MARK: UTILS
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
