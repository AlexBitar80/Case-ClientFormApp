//
//  ViewController.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var containerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.backgroundColor = .blue
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var zipCodeTextField: ZipCodeTextField = {
        let textField = ZipCodeTextField(placeholder: "Cep")
        textField.backgroundColor = .systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var streetTextField: AddressTextField = {
        let textField = AddressTextField(placeholder: "Logradouro")
        textField.backgroundColor = .systemGray5
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        self.title = "Lista de clientes"
        
        setup()
    }
    
    private func setup() {
        view.addSubview(containerScrollView)
        containerScrollView.addSubview(contentView)
        contentView.addArrangedSubview(zipCodeTextField)
        contentView.addArrangedSubview(streetTextField)
        contentView.addArrangedSubview(numberTextField)
        contentView.addArrangedSubview(districtTextField)
        contentView.addArrangedSubview(additionalAddressTextField)
        contentView.addArrangedSubview(cityTextField)
        contentView.addArrangedSubview(stateTextField)
        contentView.addArrangedSubview(addNewClientButton)
        
        NSLayoutConstraint.activate([
            containerScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: containerScrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: containerScrollView.widthAnchor),
        ])
    }
}
