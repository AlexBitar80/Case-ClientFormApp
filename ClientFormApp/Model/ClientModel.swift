//
//  ClientModel.swift
//  ClientFormApp
//
//  Created by João Alexandre on 08/04/22.
//

import Foundation

struct ClientModel: Codable {
    var info: InfoModel?
    var address: AddressModel?
    
    init(info: InfoModel, address: AddressModel) {
        self.info = info
        self.address = address
    }
}

struct InfoModel: Codable {
    let name: String?
    let email: String?
    let phone: String?
}

struct AddressModel: Codable {
    let zipCode: String?
    let number: String?
    let street: String?
    let address: String?
    let city: String?
    let state: String?
}
