//
//  LoginView.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 28.10.2021.
//

import UIKit

/// Login View presented when peforming Email & Password Login Flow
class LoginView: UIView {
    var emailTextField: UITextField! {
        didSet {
            emailTextField.textContentType = .emailAddress
        }
    }

    var passwordTextField: UITextField! {
        didSet {
            passwordTextField.textContentType = .password
        }
    }

    var emailTopConstraint: NSLayoutConstraint!
    var passwordTopConstraint: NSLayoutConstraint!

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)

        button.setBackgroundImage(Asset.Colors.primaryColor.color.image, for: .normal)
        button.setBackgroundImage(Asset.Colors.primaryColor.color.highlighted.image, for: .highlighted)
        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        return button
    }()

    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(Asset.Colors.primaryColor.color, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)

        button.layer.borderColor = Asset.Colors.primaryColor.color.cgColor
        button.layer.borderWidth = 1

        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        return button

    }()

    convenience init() {
        self.init(frame: .zero)
        setupSubviews()
    }

    // MARK: - Subviews Setup

    private func setupSubviews() {
        backgroundColor = .systemBackground
        clipsToBounds = true

        setupLogoImage()
        setupEmailTextfield()
        setupPasswordTextField()
        setupLoginButton()
        setupCreateAccountButton()
    }

    private func setupLogoImage() {
        let imageView = UIImageView(image: Asset.AppIcons.appIconNoBackground.image)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -55),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 55),
            imageView.widthAnchor.constraint(equalToConstant: 325),
            imageView.heightAnchor.constraint(equalToConstant: 325),
        ])
    }

    private func setupEmailTextfield() {
        emailTextField = textField(placeholder: "Email", symbolName: "person.crop.circle")
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
        ])

        let constant: CGFloat = UIDevice.current.orientation.isLandscape ? 20 : 50
        emailTopConstraint = emailTextField.topAnchor.constraint(
            equalTo: safeAreaLayoutGuide.topAnchor,
            constant: constant
        )
        emailTopConstraint.isActive = true
    }

    private func setupPasswordTextField() {
        passwordTextField = textField(placeholder: "Password", symbolName: "lock.fill")
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
        ])

        let constant: CGFloat = UIDevice.current.orientation.isLandscape ? 5 : 20
        passwordTopConstraint =
            passwordTextField.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: constant
            )
        passwordTopConstraint.isActive = true
    }

    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 5),
        ])
    }

    private func setupCreateAccountButton() {
        addSubview(createAccountButton)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            createAccountButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            createAccountButton.heightAnchor.constraint(equalToConstant: 44),
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8),
        ])
    }

    // MARK: - Private Helpers

    private func textField(placeholder: String, symbolName: String) -> UITextField {
        let textfield = UITextField()
        textfield.backgroundColor = .secondarySystemBackground
        textfield.layer.cornerRadius = 14
        textfield.placeholder = placeholder
        textfield.tintColor = Asset.Colors.primaryColor.color
        let symbol = UIImage(systemName: symbolName)
        textfield.setImage(symbol)
        return textfield
    }
}
