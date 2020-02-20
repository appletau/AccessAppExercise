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
        self.viewModel?.isDownloadimage.addObserver { [weak self] (isDownloading) in
            self?.isUserInteractionEnabled = isDownloading
            self?.avatarImageView.image = viewModel.avatarImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.isDownloadimage.removeObserver(atIndex: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        isAdminLabel.layer.cornerRadius = 15
    }

}
