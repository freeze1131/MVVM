//
//  UserRepository.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

class UserRepository {
    private let networkManager = NetworkManager.shared

    func fetchUsers(completion: @escaping (Result<[UserData], Error>) -> Void) {
        networkManager.fetchUsers { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

