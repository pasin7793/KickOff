
import Moya
import Foundation

enum APIService{
    case kr1
    case kr2
    case match(date: String)
}

extension APIService: TargetType{
    public var baseURL: URL{
        switch self {
        case .kr1:
            return URL(string: BaseURL.league1Url)!
        case .kr2:
            return URL(string: BaseURL.league2Url)!
        case .match:
            return URL(string: BaseURL.matchesUrl)!
        }
    }
    
    var path: String{
        switch self {
        case .kr1, .kr2, .match:
            return ""
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .kr1, .kr2, .match:
            return .get
        }
    }
    
    var sampleData: Data{
        return "@@".data(using: .utf8)!
    }
    
    var task: Task{
        switch self {
        case .kr1, .kr2:
            return .requestPlain
            
        case let .match(date):
            return .requestParameters(parameters: ["date" : date], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]?{
        switch self{
        default:
            return["Content-Type" : "application/json"]
        }
    }
}

