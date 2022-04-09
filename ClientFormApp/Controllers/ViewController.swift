//
//  ViewController.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import UIKit

final class ViewController: UIViewController {
    
    var clientInfo: InfoModel?
    
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
        textField.keyboardType = .numberPad
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var districtTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Bairro"
        textField.keyboardType = .default
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var additionalAddressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Complemento"
        textField.keyboardType = .default
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = "Cidade"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var stateTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = "Estado"
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var addNewClientButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addClient), for: .touchUpInside)
        button.layer.cornerRadius = 8.0
        button.setTitle("Adicionar Cliente", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "lightBlue")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func addClient() {
        if zipCodeTextField.isValid && streetTextField.isValid {
            let address = AddressModel(zipCode: zipCodeTextField.customTextField.text, number: numberTextField.text, street: streetTextField.customTextField.text, address: additionalAddressTextField.text, city: cityTextField.text, state: stateTextField.text)
            guard let clientInfo = clientInfo else { return }
            let clientAddress = ClientModel(info: clientInfo, address: address)
            UserDefaults.standard.saveClient(client: clientAddress)
            navigationController?.popToRootViewController(animated: true)
        } else {
            return
        }
    }
    
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
        contentStackView.setCustomSpacing(8, after: zipCodeTextField)
        contentStackView.setCustomSpacing(8, after: streetTextField)
        containerView.addSubview(addNewClientButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
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
            addNewClientButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            addNewClientButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
            addNewClientButton.heightAnchor.constraint(equalToConstant: 50),
            addNewClientButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -32),
        ])
    }
}
