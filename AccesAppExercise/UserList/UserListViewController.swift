//
//  UserListViewController.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/19.
//  Copyright © 2020 tautau. All rights reserved.
//

import Foundation
import UIKit

class UserListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    
    lazy var controller = {
       return UserListController()
    }()
    
    var viewModel:UserListViewModel {
        return controller.viewModel
    }
    
    override func viewDidLoad() {
        initBinding()
        controller.start()
        
    }
    
    func initBinding() {
        viewModel.userCellVMList.addObserver {[weak self] (_) in
            self?.tableView.reloadData()
        }
        viewModel.isLoading.addObserver {[weak self] (isLoading) in
            self?.tableView.isHidden = isLoading
        }
    }
}

extension UserListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCellVMList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCellView
        cell.setup(viewModel: viewModel.userCellVMList.value[indexPath.row])
        return cell
    }
}

extension UserListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.userCellVMList.value[indexPath.row].login_ID)
    }
}
