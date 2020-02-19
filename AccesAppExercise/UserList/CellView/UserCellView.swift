//
//  UserCellView.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/19.
//  Copyright © 2020 tautau. All rights reserved.
//

import UIKit

class UserCellView: UITableViewCell {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var loginIdLabel: UILabel!
    @IBOutlet var isAdminLabel: UILabel!
    
    var viewModel:UserCellViewModel?
    
    func setup(viewModel: UserCellViewModel) {
        self.viewModel = viewModel
        loginIdLabel.text = viewModel.login_ID
        isAdminLabel.isHidden = !viewModel.isAdmin
        RestManager.share.getData(fromURL: viewModel.avatar_url) { (data) in
            guard let data = data, let image = UIImage(data: data) else {return}
            self.avatarImageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        isAdminLabel.layer.cornerRadius = 15
    }

}
