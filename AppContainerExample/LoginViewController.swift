//
//  LoginViewController.swift
//  AppContainerExample
//
//  Created by Patrick Mick on 5/4/19.
//  Copyright © 2019 Patrick Mick. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let emailTextField = UITextField()
        emailTextField.placeholder = NSLocalizedString("Email", comment: "")
        emailTextField.keyboardType = .emailAddress
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = NSLocalizedString("Password", comment: "")
        passwordTextField.isSecureTextEntry = true
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor)
        ])
    }
}
