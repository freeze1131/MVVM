//
//  NetworkManager.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

import Foundation

struct NetworkManager {
    // To use it inside ViewModel
    static let shared = NetworkManager()
    // URL to parse
    private let baseURL = "https://jsonplaceholder.typicode.com/users"

    // Fetching the users from the URL
    func fetchUsers(completion: @escaping (Result<[UserData], Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode([UserData].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


