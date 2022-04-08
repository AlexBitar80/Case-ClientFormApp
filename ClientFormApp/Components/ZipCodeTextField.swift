//
//  ZipCodeTextField.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import UIKit

class ZipCodeTextField: UIView {
    var placeholder: String?
    
    private lazy var customTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.addTarget(self, action: #selector(didStartEditingTextField), for: .editingDidBegin)
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.text = "Cep inválido"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: .zero)
    
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didStartEditingTextField() {
        print("Clicou!")
    }
    
    private func setup() {
        addSubview(customTextField)
        addSubview(alertLabel)
        
        NSLayoutConstraint.activate([
            customTextField.topAnchor.constraint(equalTo: topAnchor),
            customTextField.heightAnchor.constraint(equalToConstant: 40),
            customTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            customTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            alertLabel.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 8),
            alertLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            alertLabel.leadingAnchor.constraint(equalTo: customTextField.leadingAnchor),
            alertLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}