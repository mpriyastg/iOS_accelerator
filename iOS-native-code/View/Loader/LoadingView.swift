//
//  LoadingView.swift
//  iOS-native-code
//
//  Created by admin on 26/05/23.
//

import SwiftUI

enum LoaderSize {
    case small
    case medium
    case large
}

struct LoadingView: View {

    var bgColor = Color("loaderBg") // background calor
    var title: String = ""  // Text to dispay message
    var color: Color = .primary // color of loader and text
    var size: LoaderSize = .small // loader and text size
    var disabled: Bool = false

    var body: some View {

        VStack {
            ProgressView {
                if !title.isEmpty {
                    Text(title)
                        .font(.system(size: 12))
                }
            }
            .foregroundColor(color)
            .progressViewStyle(CircularProgressViewStyle(tint: color))

            .scaleEffect(size == .small ?
                         DesignConstants().smallScaleEffect :
                            (size == .medium ?
                             DesignConstants().mediumScaleEffect :
                                DesignConstants().largeScaleEffect))
        }
        .frame(width: size == .small ?
               DesignConstants().smallBgSize :
                (size == .medium ?
                 DesignConstants().mediumBgSize :
                    DesignConstants().largeBgSize), height: size == .small ?
               DesignConstants().smallBgSize :
                (size == .medium ?
                 DesignConstants().mediumBgSize :
                    DesignConstants().largeBgSize))

        .background(bgColor)
        .opacity(0.8)
        .cornerRadius(10)
    }

    struct DesignConstants {

        // Background frame size
        let smallBgSize = 70.0
        let mediumBgSize = 130.0
        let largeBgSize = 170.0

        // ProgressView scale
        let smallScaleEffect = 1.0
        let mediumScaleEffect = 2.0
        let largeScaleEffect = 3.0

    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(bgColor: .clear, title: "Loading", size: .medium)
    }
}
