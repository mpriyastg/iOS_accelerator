//
//  ShareContent.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 07/06/23.
//

import Foundation
import UIKit

class ShareContent {
    // pass the contents to share (text or image or URL)
    @inlinable func share(_ text: String? = nil, _ img: UIImage? = nil, _ url: NSURL? = nil) {
        var itemsArr: [Any] = []
        if let txt = text {
            itemsArr.append(txt)
        }
        if let img = img {
            itemsArr.append(img)
        }
        if let url = url {
            itemsArr.append(url)
        }
        let aVs = UIActivityViewController(activityItems: itemsArr, applicationActivities: nil)
           let scenes = UIApplication.shared.connectedScenes
           let windowScene = scenes.first as? UIWindowScene
        if #available(iOS 15.0, *) {
            windowScene?.keyWindow?.rootViewController?.present(aVs, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }

}
