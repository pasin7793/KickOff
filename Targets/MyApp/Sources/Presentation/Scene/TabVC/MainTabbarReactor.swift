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
    
    // MARK: - Reactor
    enum Action {
        case leagueDidTap(Int)
    }
    enum Mutation {
        
    }
    struct State {
        
    }
    let initialState: State
    
    // MARK: - Init
    init(
        //
    ) {
        initialState = State()
    }
    
}

// MARK: - Mutate
extension MainTabbarReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
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
        }
    }
}

// MARK: - Method
private extension MainTabbarReactor {
    
}
