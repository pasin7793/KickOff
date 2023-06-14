//
//  DetailLeagueVM.swift
//  KickOff
//
//  Created by 임준화 on 2023/06/14.
//  Copyright © 2023 KickOff. All rights reserved.
//

import Foundation
import RxFlow



final class DetailLeagueVM: BaseViewModel, Stepper{
    
    let leagueId: Int
    
    init(leagueId: Int){
        self.leagueId = leagueId
    }
    
    
}
