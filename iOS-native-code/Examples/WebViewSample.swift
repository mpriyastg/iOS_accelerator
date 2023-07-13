//
//  WebViewSample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 06/06/23.
//

import SwiftUI

struct WebViewSample: View {
@State private var isLoading = true
    var body: some View {
        ZStack {
         WebView(isLoading: $isLoading, url: URL(string: "https://www.stgit.com")!)
            if $isLoading.wrappedValue {
                LoadingView(bgColor: .clear, size: .medium)
                    .padding(50)
            }
        }

    }
}

struct WebViewSample_Previews: PreviewProvider {
    static var previews: some View {
        WebViewSample()
    }
}
