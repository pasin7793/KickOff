//
//  MatchViewModel.swift
//  KickOff
//
//  Created by 임준화 on 2023/05/31.
//  Copyright © 2023 KickOff. All rights reserved.
//

import Moya
import RxFlow

protocol MatchesProtocol: AnyObject{
    
}

final class MatchViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<APIService>(plugins: [KOLoggingPlugin()])
    
    func getMatch(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.match(date: "20230614")) { result in
            print(result)
        }
    }
}
