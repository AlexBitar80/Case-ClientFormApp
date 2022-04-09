//
//  UserDefaults+Extensions.swift
//  ClientFormApp
//
//  Created by João Alexandre on 09/04/22.
//

import Foundation

extension UserDefaults {
    func saveClient(client: ClientModel) {
        var clientList = UserDefaults.standard.getClient()
        clientList.append(client)
        
        do {
            let data = try JSONEncoder().encode(clientList)
            let userDefault = UserDefaults.standard
            userDefault.set(data, forKey: "client")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getClient() -> [ClientModel] {
        guard let data = UserDefaults.standard.data(forKey: "client") else { return [ClientModel]() }
        
        do {
            let client = try JSONDecoder().decode([ClientModel].self, from: data)
            return client
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return [ClientModel]()
    }
}
