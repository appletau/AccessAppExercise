//
//  LoadingIndicatorView.swift
//  E-sim_ActivationApp
//
//  Created by tautau on 2019/11/20.
//  Copyright © 2019年 tautau. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicatorView:UIView {
    
    lazy var loadingIndicator:UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style:.large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        return indicator
    }()
    
    init() {
        super.init(frame: CGRect())
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopAnimating() {
        isHidden = true
        loadingIndicator.stopAnimating()
    }
}
