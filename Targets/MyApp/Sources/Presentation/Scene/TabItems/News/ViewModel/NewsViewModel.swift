//
//  NewsViewModel.swift
//  KickOff
//
//  Created by 임준화 on 2023/05/31.
//  Copyright © 2023 KickOff. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift
import Moya

protocol NewsProtocol: AnyObject{
    var newsData: PublishSubject<[NewsData]> {get}
}

final class NewsViewModel: BaseViewModel, Stepper{
    
    private let provider = MoyaProvider<League1Service>(plugins: [KOLoggingPlugin()])
    
    weak var delegate: NewsProtocol?
    
    func getNews(completion : @escaping (Result<Bool, Error>) -> ()){
        provider.request(.news){ result in
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
}
