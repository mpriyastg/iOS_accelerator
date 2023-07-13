//
//  LoaderSample.swift
//  iOS-native-code
//
//  Created by admin on 29/05/23.
//

import SwiftUI

struct LoaderSample: View {

    @State var showFullLoading = false
    @State var showLoading = false
    @State var loader = LoadingView(title: "Loading", size: .small)
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Loader animations")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                }
                Button("Small") {
                    loader = LoadingView(title: "Loading", size: .small)
                    showLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        showLoading = false
                    }
                }
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Medium") {

                    loader = LoadingView(title: "Loading", size: .medium)
                    showLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        showLoading = false
                    }
                }
                .foregroundColor(Color.blue)
                .padding(7)

                Button("Large") {
                    loader = LoadingView(title: "Loading", size: .large)
                    showLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        showLoading = false
                    }
                }
                .foregroundColor(Color.blue)
                .padding(7)
                Button("With custom text and color") {

                    loader = LoadingView(bgColor: .clear, title: "Fetching", color: .blue, size: .medium)
                    showLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        showLoading = false
                    }
                }
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Full Screen loader") {
                    showFullLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        showFullLoading = false
                    }
                }
                .foregroundColor(Color.blue)
                .padding(7)
                Spacer()
                Spacer()
            }
            if $showLoading.wrappedValue {
                VStack {
                    loader
                        .padding(50)
                }
            }
            if $showFullLoading.wrappedValue {
                VStack {
                    FullScreenLoadingView(title: "Fetching")
                }
            }
        }
    }
}

struct LoaderSample_Previews: PreviewProvider {
    static var previews: some View {
        LoaderSample()
    }
}
