
import Moya
import Foundation

enum LeagueService{
    case kr1
    case kr2
}

extension LeagueService: TargetType{
    public var baseURL: URL{
        switch self {
        case .kr1:
            return URL(string: BaseURL.league1Url)!
        case .kr2:
            return URL(string: BaseURL.league2Url)!
        }
    }
    
    var path: String{
        switch self {
        case .kr1, .kr2:
            return ""
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .kr1, .kr2:
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
        }
    }
    
    var headers: [String : String]?{
        switch self{
        default:
            return["Content-Type" : "application/json"]
        }
    }
}

