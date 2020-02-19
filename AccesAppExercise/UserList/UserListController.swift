//
//  UserListController.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/19.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

class UserListController {
    let viewModel = UserListViewModel()
    
    func start() {
        viewModel.isLoading.value = true
        let queryParams = ["per_page":"100"]
        let url: URL? = URL(string: "https://api.github.com/users")
        let httpRequest = HttpRequest(url: url!, method: .get, queryParams:queryParams)
        
        RestManager.share.makeRequest(httpRequest) { (results) in
            let jsonDecoder = JSONDecoder()
            do {
                let users = try jsonDecoder.decode([User].self, from: results.data!)
                self.viewModel.userCellVMList.value = users.map(){UserCellViewModel(user: $0)}
                self.viewModel.isLoading.value = false
            } catch(let error){
                print(error)
            }
        }
    }
}
