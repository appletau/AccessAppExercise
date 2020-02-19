//
//  UserListViewModel.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/19.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

class UserListViewModel {
    var isLoading = Observable(value: false)
    var userCellVMList = Observable<[UserCellViewModel]>(value: [])
}
