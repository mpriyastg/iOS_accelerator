//
// Copyright © 2023 STGInfotech. All rights reserved.
//

enum NetworkType {

    case unknown
    case noConnection
    case wifi
    case wwan2g
    case wwan3g
    case wwan4g
    case wwan5g

    var trackingId: String {
        switch self {
        case .noConnection: return ""
        case .wifi: return "WiFi"
        case .wwan2g: return "2G"
        case .wwan3g: return "3G"
        case .wwan4g: return "4G (LTE)"
        case .wwan5g: return "5G"
        case .unknown: return "Unknown"
        }
    }

}
