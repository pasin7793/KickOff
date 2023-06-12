//
//  MatchViewModel.swift
//  KickOff
//
//  Created by 임준화 on 2023/05/31.
//  Copyright © 2023 KickOff. All rights reserved.
//

import Moya
import RxFlow
import Foundation

protocol MatchesProtocol: AnyObject{
    
}

final class MatchViewModel: BaseViewModel, Stepper{
    
    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "yyyyMMdd"
    }
    
    private let provider = MoyaProvider<APIService>(plugins: [KOLoggingPlugin()])
    
    func getMatch(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.match(date: formatter.string(from: now))) { result in
            print(result)
        }
    }
}
