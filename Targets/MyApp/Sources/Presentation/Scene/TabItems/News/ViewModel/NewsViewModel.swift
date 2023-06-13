
import Foundation
import RxFlow
import RxSwift
import Moya

protocol NewsProtocol: AnyObject{
    var newsData: PublishSubject<[NewsData]> {get}
}

protocol TransferProtocol: AnyObject{
    var transferData: PublishSubject<[TransferList]> {get set}
}

final class NewsViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<APIService>(plugins: [KOLoggingPlugin()])
    
    weak var delegate: NewsProtocol?
    weak var transferDelegate: TransferProtocol?
    
    func getNews(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.kr1){ result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(NewsList.self, from: response.data)
                    self.delegate?.newsData.onNext(json.news.data)
                    completion(.success(true))
                } catch {
                    print(error)
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
    func getTransfer(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.kr1) { result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(Transfer.self, from: response.data)
                    self.transferDelegate?.transferData.onNext(json.transfers.data)
                } catch{
                    print(error)
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
}
