//
//  ViewController.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import UIKit

final class ViewController: UIViewController {
    
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

    private lazy var zipCodeTextField: ZipCodeTextField = {
        let textField = ZipCodeTextField(placeholder: "Cep")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var streetTextField: AddressTextField = {
        let textField = AddressTextField(placeholder: "Logradouro")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Número"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var districtTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Bairro"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var additionalAddressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Complemento"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Cidade"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var stateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Estado"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var addNewClientButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8.0
        button.setTitle("Adicionar Cliente", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Informações de endereço"
        
        setup()
    }
    
    private func setup() {
        view.addSubview(containerView)
        containerView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(zipCodeTextField)
        contentStackView.addArrangedSubview(streetTextField)
        contentStackView.addArrangedSubview(numberTextField)
        contentStackView.addArrangedSubview(districtTextField)
        contentStackView.addArrangedSubview(additionalAddressTextField)
        contentStackView.addArrangedSubview(cityTextField)
        contentStackView.addArrangedSubview(stateTextField)
        containerView.addSubview(addNewClientButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 80),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.heightAnchor.constraint(equalToConstant: 40),
            districtTextField.heightAnchor.constraint(equalToConstant: 40),
            numberTextField.heightAnchor.constraint(equalToConstant: 40),
            additionalAddressTextField.heightAnchor.constraint(equalToConstant: 40),
            cityTextField.heightAnchor.constraint(equalToConstant: 40),
            stateTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            addNewClientButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            addNewClientButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            addNewClientButton.heightAnchor.constraint(equalToConstant: 50),
            addNewClientButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
}
