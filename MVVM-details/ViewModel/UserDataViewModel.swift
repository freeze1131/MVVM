//
//  UserDataViewModel.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

class UserDataViewModel {
    // Repository for fetching users
    private let userRepository = UserRepository()
    // Data array to use
    private var users: [UserData] = []
    var onUsersUpdated: (() -> Void)?

    // Fetching the users and assinging to the users array
    func fetchUsers() {
        userRepository.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.onUsersUpdated?()
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }

    //To use inside tableview row count
    func numberOfUsers() -> Int {
        return users.count
    }

    //To use when navigating to the userDetail VC
    func user(at index: Int) -> UserData {
        return users[index]
    }
}
