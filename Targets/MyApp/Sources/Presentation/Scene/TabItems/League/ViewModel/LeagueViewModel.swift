
import Foundation
import RxFlow
import RxSwift
import Moya

protocol LeagueProtocol: AnyObject{
    var leagueData: BehaviorSubject<[League]> {get set}
    var league2Data: BehaviorSubject<[League]> {get set}
}

final class LeagueViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<APIService>(plugins: [KOLoggingPlugin()])
    
    weak var delegate: LeagueProtocol?
    weak var delegate2: LeagueProtocol?
    
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
                    self.delegate2?.league2Data.onNext(league2Json.table.first?.data.table.all ?? .init())
                    completion(.success(true))
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
