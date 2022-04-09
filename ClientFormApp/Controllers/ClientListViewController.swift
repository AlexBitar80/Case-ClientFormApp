//
//  ClientListViewController.swift
//  ClientFormApp
//
//  Created by João Alexandre on 09/04/22.
//

import UIKit

final class ClientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var client: [ClientModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Lista de clientes"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo", style: .plain, target: self, action: #selector(handleAddNewClient))
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        client = UserDefaults.standard.getClient()
    }
   
    
    @objc func handleAddNewClient() {
        navigationController?.pushViewController(ClientInfoViewController(), animated: true)
    }
    
    private func setup() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return client?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = client?[indexPath.row].info?.name
        
        print(client?[indexPath.row] as Any)
        
        return cell
    }
}
