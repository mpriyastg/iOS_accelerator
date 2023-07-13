import Foundation
//import Alamofire

//class NetworkManager: NSObject {
//
//    static let shared = NetworkManager()
//
//    private override init() {}
//
//    func makeAPICall(urlString: String,
//                     parameters: [String: Any] = [:],
//                     headers: HTTPHeaders = [:],
//                     method: String = "GET",
//                     encoding: ParameterEncoding = JSONEncoding.default,
//                     completion: @escaping ([String: Any]?) -> Void) {
//        AF.request(urlString,
//                   method: HTTPMethod(rawValue: method),
//                   parameters: parameters,
//                   encoding: encoding,
//                   headers: headers).responseJSON { response in
//            if let responseData = response.value {
//                print("***********Success")
//            } else {
//                print("***********failed")
//            }
//        }
//    }
//
//}
