//
//  HomeReactor.swift
//  MOIZA
//
//  Created by 최형우 on 2022/02/15.
//  Copyright © 2022 com.connect. All rights reserved.
//

import ReactorKit
import RxFlow
import RxSwift
import RxRelay

final class MainTabbarReactor: Reactor, Stepper {
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag: DisposeBag = .init()
    
    private let fetchLeagueListUseCase: FetchLeagueListUseCase
    
    // MARK: - Reactor
    enum Action {
        case viewDidLoad
        case leagueDidTap(Int)
    }
    enum Mutation {
        case setIsLoading(Bool)
        case setClubList([LeagueList])
    }
    struct State {
        var leagueList: [LeagueList]
        var isLoading: Bool
        var isRefreshing: Bool
    }
    let initialState: State
    
    // MARK: - Init
    init(
        fetchLeagueListUseCase: FetchLeagueListUseCase
    ) {
        initialState = State(
            leagueList: [],
            isLoading: false,
            isRefreshing: false)
    }
    
}

// MARK: - Mutate
extension MainTabbarReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        case .viewDidLoad:
            return viewDidLoad()
            
        case let .leagueDidTap(leagueId):
            steps.accept(KOStep.detailLeagueIsRequired(id: leagueId))
        }
        return .empty()
    }
}

// MARK: - Reduce
extension MainTabbarReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        case let .setIsLoading(load):
            newState.isLoading = load
        case let .setClubList(list):
            newState.leagueList = list
        }
        
        return newState
    }
}

// MARK: - Method
private extension MainTabbarReactor {
    func viewDidLoad() -> Observable<Mutation> {
        let start = Observable.just(Mutation.setIsLoading(true))
        let leagues: Observable<([LeagueList])> = Observable.just(
            fetchLeagueListUseCase.execute(type: .league1).asObservable()
        )
    }
}
