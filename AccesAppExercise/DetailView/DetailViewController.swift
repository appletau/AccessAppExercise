//
//  DetailViewController.swift
//  AccesAppExercise
//
//  Created by tautau on 2020/2/20.
//  Copyright © 2020 tautau. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    @IBOutlet var loginIdLabel: UILabel!
    @IBOutlet var adminLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var seperateLine: UIView!
    lazy var lodaingIndicatorView:LoadingIndicatorView = {
        let v = LoadingIndicatorView()
        self.view.addSubview(v)
        v.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        v.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        return v
    }()
    
    lazy var controller = {
        return DetailController()
    }()
    
    var viewModel:DetailViewModel {
        return controller.viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initBinding()
        controller.start()

    }
    
    func setupUI() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
    }
    
    func initBinding() {
        viewModel.user.addObserver {[weak self] (user) in
            guard let user = user, let self = self else{return}
            self.avatarImageView.image = self.viewModel.avatarImage
            self.nameLabel.text = user.name
            self.bioLabel.text = user.bio
            self.loginIdLabel.text = user.login
            self.adminLabel.isHidden = !user.site_admin
            self.locationLabel.text = user.location
            self.linkLabel.text = user.blog
        }
        
        viewModel.isLoading.addObserver {[weak self] (isLoading) in
            guard let self = self else{return}
            if isLoading {
                self.lodaingIndicatorView.startAnimating()
            } else {
                self.lodaingIndicatorView.stopAnimating()
            }
        }
    }
    
    
    @IBAction func btnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
