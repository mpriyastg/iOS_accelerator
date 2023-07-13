//
//  APIManager.swift
//  iOS-native-code
//
//  Created by admin on 19/04/23.
//

import Foundation
//import Alamofire

//class Connectivity {
//    class var isConnectedToInternet: Bool {
//        return NetworkReachabilityManager()?.isReachable ?? false
//    }
//}
//enum ResponseData {
//    case dictionaryResponse(value: [String: Any])
//    case arrayResponse(value: [Any])
//}
//class NetworkOperation {
//    func request<T: Decodable>(_ endpoint: Endpoint,
//                               method: HTTPMethod,
//                               parameters: [String: Any]? = nil,
//                               onSuccess success: @escaping (T) -> Void,
//                               onFailure failure: @escaping (Error) -> Void) {
//            guard let url = URL(string: endpoint.url) else {
//                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
//                failure(error)
//                return
//            }
//            AF.request(url, method: method,
//                       parameters: parameters,
//                       encoding: JSONEncoding.default,
//                       headers: endpoint.headers,
//                       requestModifier: { $0.timeoutInterval = 5 }).responseData { response in
//                switch response.result {
//                case .success(let res):
//                    do {
//                        let decoder = JSONDecoder()
//                        let jsonObject = try decoder.decode(T.self, from: res)
//                        success(jsonObject)
//                    } catch {
//                        failure(error)
//                    }
//                case .failure(let error):
//                    failure(error)
//                }
//            }
//        }
//}
