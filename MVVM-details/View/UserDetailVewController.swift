//
//  UserDetailVewController.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

import UIKit


class UserDetailVewController: UIViewController {
    var data: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let data = data {
            print("Passed data: \(data)")
        }
    }
    
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        self.navigationItem.title = data?.name
    }
}
