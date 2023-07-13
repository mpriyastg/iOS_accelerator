//
// Copyright © 2023 STGInfotech. All rights reserved.
//

import Foundation
import UIKit

struct Constants {

    enum DateFormat {
        static let iso = "yyyy-MM-dd"
        static let usa = "MM/dd/yyyy"
        static let month = "LLLL"
        static let year = "yyyy"
        static let dateWithTimeZone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }

    enum Defaults {
        static let emptyValue = "-"
        static let emptyInput = ""
        static let emptySpace = " "
    }

    enum Devices {

        // Widths
        /// iPhone: 2G/3G/3GS/4/4s/5/5s/5c/1st Gen SE
        static let iphoneSEWidth: CGFloat = 320
        /// iPhone: 6/6s/7/8/X/Xs/11 Pro/2nd Gen SE/12 Mini
        static let iphoneSixWidth: CGFloat = 375
        /// iPhone: 12/12 Pro
        static let iphoneTwelveWidth: CGFloat = 390
        /// iPhone: XR/Xs Max/11/11 Pro Max
        static let iphoneXRWidth: CGFloat = 414
        /// iPhone: 12 Pro Max
        static let iphoneTwelveProMaxWidth: CGFloat = 428

        // Heights
        /// iPhone: 2G/3G/3GS/4/4s
        static let iphoneFourHeight: CGFloat = 480
        /// iPhone: 5/5s/5c/1st Gen SE
        static let iphoneSEHeight: CGFloat = 568
        /// iPhone: 6/6s/7/8/2nd Gen SE
        static let iphoneSixHeight: CGFloat = 667
        /// iPhone: 6+/6s+/7+/8+
        static let iphoneSixPlusHeight: CGFloat = 736
        /// iPhone: X/Xs/11 Pro/12 Mini
        static let iphoneXHeight: CGFloat = 812
        /// iPhone: 12/12 Pro
        static let iphoneTwelveHeight: CGFloat = 844
        /// iPhone: XR/Xs Max/11/11 Pro Max
        static let iphoneXRHeight: CGFloat = 896
        /// iPhone: 12 Pro Max
        static let iphoneTwelveProMaxHeight: CGFloat = 926

    }

}
