//
//  DetailViewModel.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/20.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel {
    var avatarImage:UIImage?
    var user = Observable<User?>(value: nil)
    var isLoading = Observable(value: false)
}
