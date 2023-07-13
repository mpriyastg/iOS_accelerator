//
// Copyright © 2023 STGInfotech. All rights reserved.
//

//import Alamofire
import CoreTelephony

//extension NetworkReachabilityManager {
//
//    static func getNetworkType() -> NetworkType {
//        guard let reachability = NetworkReachabilityManager() else {
//            return .unknown
//        }
//        if !reachability.isReachable {
//            return .noConnection
//        } else {
//            if reachability.isReachableOnEthernetOrWiFi {
//                return .wifi
//            } else if reachability.isReachableOnCellular {
//                return getWWANNetworkType()
//            } else {
//                return .unknown
//            }
//        }
//    }
//
//    static func getWWANNetworkType() -> NetworkType {
//        guard let dict = CTTelephonyNetworkInfo().serviceCurrentRadioAccessTechnology,
//              let firstKey = dict.keys.first
//        else {
//            return .unknown
//        }
//        let currentRadioAccessTechnology = dict[firstKey]
//        switch currentRadioAccessTechnology {
//        case CTRadioAccessTechnologyGPRS,
//             CTRadioAccessTechnologyEdge,
//             CTRadioAccessTechnologyCDMA1x:
//            return .wwan2g
//        case CTRadioAccessTechnologyWCDMA,
//             CTRadioAccessTechnologyHSDPA,
//             CTRadioAccessTechnologyHSUPA,
//             CTRadioAccessTechnologyCDMAEVDORev0,
//             CTRadioAccessTechnologyCDMAEVDORevA,
//             CTRadioAccessTechnologyCDMAEVDORevB,
//             CTRadioAccessTechnologyeHRPD,
//             CTRadioAccessTechnologyLTE:
//            return .wwan3g
//        default:
//            return .unknown
//        }
//    }
//
//}
