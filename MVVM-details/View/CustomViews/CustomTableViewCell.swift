//
//  CustomTableViewCell.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emaillabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }
}
