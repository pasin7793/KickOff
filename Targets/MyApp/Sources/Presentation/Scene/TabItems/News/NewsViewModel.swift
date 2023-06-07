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

protocol fetchingData: AnyObject{
    var fetchData: PublishSubject<[NewsData]> {get}
}

final class NewsViewModel: BaseViewModel, Stepper{
    weak var delegate: fetchingData?
    
    func getNews(){
        
    }
}
