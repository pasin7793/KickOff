
import Foundation
import RxFlow
import RxSwift
import Moya

protocol LeagueProtocol: AnyObject{
    var leagueData: PublishSubject<[League]> {get}
}

final class LeagueViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<League1Service>(plugins: [KOLoggingPlugin()])
    
    weak var delegate: LeagueProtocol?
    
    func getLeague(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.news) { result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(LeagueList.self, from: response.data)
                    self.delegate?.leagueData.onNext(json.table.first?.data.table.all ?? .init())
                } catch {
                    print(error)
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
}
