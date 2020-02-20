//
//  DetailController.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/20.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation

class DetailController {
    var viewModel = DetailViewModel()
    var selectedCellVM:UserCellViewModel?
    
    func start() {
        guard let id = selectedCellVM?.login_ID else {return}
        viewModel.isLoading.value = true
        self.viewModel.avatarImage = selectedCellVM?.avatarImage
        let url: URL? = URL(string: "https://api.github.com/users/\(id)")
        let httpRequest = HttpRequest(url: url!, method: .get)
        
        RestManager.share.makeRequest(httpRequest) { (results) in
            let jsonDecoder = JSONDecoder()
            do {
                let user = try jsonDecoder.decode(User.self, from: results.data!)
                self.viewModel.isLoading.value = false
                self.viewModel.user.value = user
            } catch(let error){
                print(error)
            }
        }
    }
}
