
import Foundation
import RxFlow
import RxSwift
import Moya

protocol LeagueProtocol: AnyObject{
    var leagueData: BehaviorSubject<[League]> {get set}
    var league2Data: BehaviorSubject<[League]> {get set}
}

final class LeagueViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<LeagueService>(plugins: [KOLoggingPlugin()])
    
    weak var delegate: LeagueProtocol?
    weak var delegate2: LeagueProtocol?
    
    var league2Data: [League] = []
    
    func getLeague1(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.kr1) { result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let league1Json = try decoder.decode(LeagueList.self, from: response.data)
                    self.delegate?.leagueData.onNext(league1Json.table.first?.data.table.all ?? .init())
                    completion(.success(true))
                } catch {
                    print(error)
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getLeague2(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.kr2) { result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let league2Json = try decoder.decode(LeagueList.self, from: response.data)
                    //self.delegate2?.league2Data.onNext(league2Json.table.first?.data.table.all ?? .init())
                    self.league2Data = league2Json.table.first?.data.table.all ?? .init()
                    completion(.success(true))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                    print(error.localizedDescription)
                
                } catch {
                    print(error)
                }
                
            case let .failure(err):
                print(err.localizedDescription)
                completion(.failure(err))
            }
        }
    }
}
