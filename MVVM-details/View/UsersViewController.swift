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
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchUsers()
    }
    
    //MARK: UI Setup
    private func setupUI() {
        // Showing the title large and to the left logic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "Users"
        
        // Table view setup
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
    }

    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            self?.usersTableView.reloadData()
        }
    }
    
    
    // Used for passing data when navigating from a segueway
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let destinationVC = segue.destination as? UserDetailViewController,
               let indexPath = sender as? IndexPath {
                let user = viewModel.user(at: indexPath.row)
                destinationVC.selectedUser = user
            }
        }
    }
}


//MARK: Table view delegate methods
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Getting the cell count from response
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers()
    }
    
    
    // Custom cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        let user = viewModel.user(at: indexPath.row)
        cell.nameLabel.text = user.name
        cell.emaillabel.text = user.email
        
        return cell
    }
    
    // Setting the height of each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // Triggering the navigation to user detail by segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
