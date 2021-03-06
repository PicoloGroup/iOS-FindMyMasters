//
//  LoginViewController.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 28.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    weak var delegate: LoginDelegate?

    private var loginView: LoginView { view as! LoginView }

    private var email: String { loginView.emailTextField.text! }
    private var password: String { loginView.passwordTextField.text! }

    // Hides tab bar when view controller is presented
    override var hidesBottomBarWhenPushed: Bool { get { true } set {} }

    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureDelegatesAndHandlers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setTitleColor(.label)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        navigationController?.setTitleColor(.systemOrange)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.popViewController(animated: false)
    }

    // Dismisses keyboard when view is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - Firebase 🔥

    private func login(with email: String, password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) { _, error in
//            guard error == nil else { return self.displayError(error) }
//            self.delegate?.loginDidOccur()
//        }
    }

    private func createUser(email: String, password: String) {
//        Auth.auth().createUser(withEmail: email, password: password) { _, error in
//            guard error == nil else { return self.displayError(error) }
//            self.delegate?.loginDidOccur()
//        }

       let authProvider = APIProviders.shared.authProvider
        authProvider.request(.signup(email, password)) { result in
            Log.debug(result)

            switch result {
            case let .success(response):
                Log.debug(response)
            case let .failure(response):
                Log.debug(response)
            }
        }
    }

    // MARK: - Action Handlers

    @objc
    private func handleLogin() {
        login(with: email, password: password)
    }

    @objc
    private func handleCreateAccount() {
        createUser(email: email, password: password)
    }

    // MARK: - UI Configuration

    private func configureNavigationBar() {
        navigationItem.title = "Welcome"
        navigationItem.backBarButtonItem?.tintColor = .systemYellow
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureDelegatesAndHandlers() {
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginView.createAccountButton.addTarget(
            self,
            action: #selector(handleCreateAccount),
            for: .touchUpInside
        )
    }

    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        loginView.emailTopConstraint.constant = UIDevice.current.orientation.isLandscape ? 15 : 50
        loginView.passwordTopConstraint.constant = UIDevice.current.orientation.isLandscape ? 5 : 20
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginView.emailTextField.isFirstResponder, loginView.passwordTextField.text!.isEmpty {
            loginView.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
