//
//  UsersViewController.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

import Foundation


import UIKit

class UsersViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = UserDataViewModel()

    @IBOutlet weak var usersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchUsers()
    }

    private func setupUI() {
        self.navigationItem.title = "Acoman!!"
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
    }

    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            self?.usersTableView.reloadData()
        }
    }
}

extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell

        let user = viewModel.user(at: indexPath.row)
        cell.nameLabel.text = user.name
        cell.emaillabel.text = user.email
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
