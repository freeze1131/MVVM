//
//  UserDataViewModel.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

import Foundation

class UserDataViewModel {
    var users: [UserData] = []
    var onUsersUpdated: (() -> Void)?

    func fetchUsers() {
        NetworkManager.shared.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.onUsersUpdated?()
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }

    func numberOfUsers() -> Int {
        return users.count
    }

    func user(at index: Int) -> UserData {
        return users[index]
    }
}
