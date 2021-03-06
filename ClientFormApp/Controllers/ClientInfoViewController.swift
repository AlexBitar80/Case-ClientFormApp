//
//  ClientInfoViewController.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import UIKit

final class ClientInfoViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        textField.keyboardType = .default
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var phoneTextField: PhoneTextField = {
        let textField = PhoneTextField(placeholder: "Telefone")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nextScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Próxima tela", for: .normal)
        button.addTarget(self, action: #selector(textFieldValidate), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "lightBlue")
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func textFieldValidate() {
        if phoneTextField.isValid {
            let vc = ViewController()
            vc.clientInfo = InfoModel(name: nameTextField.text, email: emailTextField.text, phone: phoneTextField.customTextField.text)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Informações pessoais"
        
        setup()
    }
    
    private func setup() {
        view.addSubview(containerView)
        containerView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(nameTextField)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(phoneTextField)
        containerView.addSubview(nextScreenButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 80),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            nextScreenButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            nextScreenButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nextScreenButton.heightAnchor.constraint(equalToConstant: 50),
            nextScreenButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
}
