//
//  ViewController.swift
//  AuthAppUIKit
//
//  Created by Tes on 28/03/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Login"
            label.font = .systemFont(ofSize: 40, weight: .bold)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let emailContainerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.layer.borderWidth = 0.3
            view.layer.borderColor = UIColor.white.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let emailIconView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "envelope")
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let emailTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter email"
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(
                string: "Enter email",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
            textField.autocapitalizationType = .none
            textField.keyboardType = .emailAddress
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let passwordContainerView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.layer.borderWidth = 0.3
            view.layer.borderColor = UIColor.white.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let passwordIconView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "lock")
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Password"
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(
                string: "Password",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let passwordVisibilityButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.tintColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let forgotPasswordButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Forgot password?", for: .normal)
            button.setTitleColor(UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0), for: .normal)
            button.contentHorizontalAlignment = .left
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Login", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            button.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
            button.layer.cornerRadius = 12
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let dividerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        private let leftDivider: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blue
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let orLabel: UILabel = {
            let label = UILabel()
            label.text = "or"
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let rightDivider: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blue
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let googleButton: UIButton = {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let googleIconView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "google"))
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let googleLabel: UILabel = {
            let label = UILabel()
            label.text = "Continue with Google"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let appleButton: UIButton = {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    // MARK: - UI Components
    private let appleIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "apple.logo")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let appleLabel: UILabel = {
        let label = UILabel()
        label.text = "Continue with Apple"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Properties
    private var isPasswordVisible: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        setupActions()
    }
    
    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.15, alpha: 1.0)
    }
    
    private func setupHierarchy() {
        // Add email components
        view.addSubview(titleLabel)
        view.addSubview(emailContainerView)
        emailContainerView.addSubview(emailIconView)
        emailContainerView.addSubview(emailTextField)
        
        // Add password components
        view.addSubview(passwordContainerView)
        passwordContainerView.addSubview(passwordIconView)
        passwordContainerView.addSubview(passwordTextField)
        passwordContainerView.addSubview(passwordVisibilityButton)
        
        // Add buttons and dividers
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        
        view.addSubview(dividerStackView)
        dividerStackView.addArrangedSubview(leftDivider)
        dividerStackView.addArrangedSubview(orLabel)
        dividerStackView.addArrangedSubview(rightDivider)
        
        // Add social login buttons
        view.addSubview(googleButton)
        googleButton.addSubview(googleIconView)
        googleButton.addSubview(googleLabel)
        
        view.addSubview(appleButton)
        appleButton.addSubview(appleIconView)
        appleButton.addSubview(appleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // Title label
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Email container
            emailContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailContainerView.heightAnchor.constraint(equalToConstant: 55),
            
            // Email icon
            emailIconView.leadingAnchor.constraint(equalTo: emailContainerView.leadingAnchor, constant: 15),
            emailIconView.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor),
            emailIconView.widthAnchor.constraint(equalToConstant: 25),
            emailIconView.heightAnchor.constraint(equalToConstant: 25),
            
            // Email textfield
            emailTextField.leadingAnchor.constraint(equalTo: emailIconView.trailingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: emailContainerView.trailingAnchor, constant: -15),
            emailTextField.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor),
            
            // Password container
            passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 20),
            passwordContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordContainerView.heightAnchor.constraint(equalToConstant: 55),
            
            // Password icon
            passwordIconView.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor, constant: 15),
            passwordIconView.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            passwordIconView.widthAnchor.constraint(equalToConstant: 25),
            passwordIconView.heightAnchor.constraint(equalToConstant: 25),
            
            // Password textfield
            passwordTextField.leadingAnchor.constraint(equalTo: passwordIconView.trailingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordVisibilityButton.leadingAnchor, constant: -10),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            
            // Password visibility button
            passwordVisibilityButton.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor, constant: -15),
            passwordVisibilityButton.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            passwordVisibilityButton.widthAnchor.constraint(equalToConstant: 25),
            passwordVisibilityButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Forgot password button
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 10),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Login button
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            // Divider stack view
            dividerStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            dividerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            leftDivider.heightAnchor.constraint(equalToConstant: 1),
            rightDivider.heightAnchor.constraint(equalToConstant: 1),
            
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            
            // Google button
            googleButton.bottomAnchor.constraint(equalTo: appleButton.topAnchor, constant: -20),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            googleButton.heightAnchor.constraint(equalToConstant: 55),
            
            googleIconView.leadingAnchor.constraint(equalTo: googleButton.leadingAnchor, constant: 20),
            googleIconView.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor),
            googleIconView.widthAnchor.constraint(equalToConstant: 25),
            googleIconView.heightAnchor.constraint(equalToConstant: 25),
            
            googleLabel.centerXAnchor.constraint(equalTo: googleButton.centerXAnchor),
            googleLabel.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor),
            
            // Apple button
            appleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            appleButton.heightAnchor.constraint(equalToConstant: 55),
            
            appleIconView.leadingAnchor.constraint(equalTo: appleButton.leadingAnchor, constant: 20),
            appleIconView.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor),
            appleIconView.widthAnchor.constraint(equalToConstant: 25),
            appleIconView.heightAnchor.constraint(equalToConstant: 25),
            
            appleLabel.centerXAnchor.constraint(equalTo: appleButton.centerXAnchor),
            appleLabel.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor)
        ])
    }
    
    private func setupActions() {
        passwordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        appleButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        let imageName = isPasswordVisible ? "eye.slash" : "eye"
        passwordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func forgotPasswordTapped() {
        // Handle forgot password
        print("Forgot password tapped")
    }
    
    @objc private func loginButtonTapped() {
        // Handle login
        print("Login button tapped")
    }
    
    @objc private func googleButtonTapped() {
        // Handle Google sign-in
        print("Google sign-in tapped")
    }
    
    @objc private func appleButtonTapped() {
        // Handle Apple sign-in
        print("Apple sign-in tapped")
    }
}
