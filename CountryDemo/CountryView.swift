//
//  ContentView.swift
//  Country-Demo
//
//  Created by Slamet on 14/12/23.
//

import SwiftUI
import WebKit


// MARK: MODEL of Country
struct CountryResponse: Decodable {
    let data: [Country]
    let msg: String
}

struct Country: Identifiable, Decodable {
    let id: Int?
    let name: String
    let flag: String
    var imageUrl: URL? {
        return URL(string: "\(flag)")
    }
}

// MARK: Main of View
struct CountryView: View {
    
    @State private var countryList: [Country] = []
    
    var body: some View {
        List {
            ForEach(countryList) { country in
                CountrySubView(country: country)
            }
        }
        .task {
            do {
                countryList = try await getCountryList()
            } catch {
                print("error")
            }
        }
    }
    
    // MARK: fetchCountry
    func getCountryList() async throws -> [Country] {
        
        guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries/flag/images") else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let countryList = try JSONDecoder().decode(CountryResponse.self, from: data)
        return countryList.data
    }
}

// MARK: CustomView
struct CountrySubView: View {
    
    var country: Country
    
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
        CountryView()
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
