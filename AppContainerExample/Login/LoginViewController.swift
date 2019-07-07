//
//  LoginViewController.swift
//  AppContainerExample
//
//  Created by Patrick Mick on 5/4/19.
//  Copyright © 2019 Patrick Mick. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    private let loginHandler: () -> Void
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("Email", comment: "")
        textField.keyboardType = .emailAddress
        textField.addTarget(self, action: #selector(credentialsDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = NSLocalizedString("Password", comment: "")
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(credentialsDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(loginHandler: @escaping () -> Void) {
        self.loginHandler = loginHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
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
    
    @objc
    private func credentialsDidChange() {
        let credentialsAreValid = emailTextField.text?.isEmpty == false &&
            passwordTextField.text?.isEmpty == false
        loginButton.isEnabled = credentialsAreValid
    }
    
    @objc
    private func loginButtonTapped() {
        loginHandler()
    }
}
