//
//  WebView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 06/06/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    typealias UIViewType = WKWebView
        @Binding var isLoading: Bool
    let url: URL

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

        uiView.navigationDelegate = context.coordinator
        uiView.load(URLRequest(url: url))
    }

    class Coordinator: NSObject, WKNavigationDelegate {

        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }

    }
}
