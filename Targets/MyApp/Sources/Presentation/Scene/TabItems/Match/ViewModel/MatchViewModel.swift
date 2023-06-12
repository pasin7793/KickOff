//
//  MatchViewModel.swift
//  KickOff
//
//  Created by 임준화 on 2023/05/31.
//  Copyright © 2023 KickOff. All rights reserved.
//

import Moya
import RxFlow
import RxSwift
import Foundation

protocol MatchProtocol: AnyObject{
    var matchData: BehaviorSubject<[Match]> {get set}
}

final class MatchViewModel: BaseViewModel, Stepper{
    
    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "yyyyMMdd"
    }
    
    weak var delegate: MatchProtocol?
    
    private let provider = MoyaProvider<APIService>(plugins: [KOLoggingPlugin()])
    
    func getMatch(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.match(date: formatter.string(from: now))) { result in
            print(result)
            switch result{
            case let .success(response):
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(MatchList.self, from: response.data)
                    self.delegate?.matchData.onNext(json.leagues.first?.matches ?? .init())
                    completion(.success(true))
                } catch {
                    print(error)
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
}
