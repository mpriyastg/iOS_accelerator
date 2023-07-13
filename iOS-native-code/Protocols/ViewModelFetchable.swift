//
// Copyright © 2023 STGInfotech. All rights reserved.
//

public enum FetchResult {

    case failure
    case success

    public var isSuccess: Bool {
        switch self {
        case .failure: return false
        case .success: return true
        }
    }

}

public protocol ViewModelFetchable {
    func fetchData(completion: @escaping FetchableResult)
}

public extension ViewModelFetchable {
    typealias FetchableResult = (FetchResult) -> Void
}
