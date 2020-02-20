//
//  UserCellViewModel.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/19.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import UIKit

class UserCellViewModel {
    var identifier:UUID
    var login_ID:String
    var avatar_url:URL
    var isDownloadimage = Observable<Bool>(value: false)
    var avatarImage = UIImage(named: "avatarPlaceholder")
    var isAdmin:Bool
    
    init(user:User) {
        self.login_ID = user.login
        self.avatar_url = user.avatar_url
        self.isAdmin = user.site_admin
        self.identifier = UUID()
        RestManager.share.getData(fromURL: self.avatar_url) { (data) in
            guard let data = data, let image = UIImage(data: data) else {return}
            self.avatarImage = image
            self.isDownloadimage.value = true
        }
    }
}

extension UserCellViewModel:Hashable {
    static func == (lhs: UserCellViewModel, rhs: UserCellViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
