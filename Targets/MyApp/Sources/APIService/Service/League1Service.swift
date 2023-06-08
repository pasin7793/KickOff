
import Moya
import Foundation

enum League1Service{
    case news
}

extension League1Service: TargetType{
    public var baseURL: URL{
        return URL(string: BaseURL.league1Url)!
    }
    
    var path: String{
        switch self {
        case .news:
            return ""
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .news:
            return .get
        }
    }
    
    var sampleData: Data{
        return "@@".data(using: .utf8)!
    }
    
    var task: Task{
        switch self {
        case .news:
            return .requestPlain
        }
    }
    
    var headers: [String : String]?{
        switch self{
        default:
            return["Content-Type" : "application/json"]
        }
    }
}

